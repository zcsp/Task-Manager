class TaskGroupsController < ApplicationController
  before_action :set_task_group, only: %i[ show edit update destroy ]

  # GET /task_groups or /task_groups.json
  def index
    if params[:project_id]
      task_groups = TaskGroup.where(project_id: params[:project_id])
    else
      task_groups = TaskGroup.all
    end
    render json: task_groups.map { |tg| tg.as_json(include: :tasks) }
  end

  # GET /task_groups/1 or /task_groups/1.json
  def show
  end

  # GET /task_groups/new
  def new
    @task_group = TaskGroup.new
  end

  # GET /task_groups/1/edit
  def edit
  end

  # POST /task_groups or /task_groups.json
  def create
    task_group = TaskGroup.new(task_group_params)
    task_group.name = 'New Task Group'
    if task_group.save
      project = Project.find(params[:project_id])
      project = project.as_json(include: { :task_groups => { :include => :tasks }})
      render json: project
    else
      render json: task_group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /task_groups/1 or /task_groups/1.json
  def update
    tg = TaskGroup.find(params[:id])
    tg.update(task_group_params)
    render json: tg
  end

  # PATCH/PUT /task_groups/1/order or /task_groups/1/order.json
  def update_order
    tg = TaskGroup.find(params[:id])
    project_task_group_count = TaskGroup.where(project_id: tg.project_id).count()
    new_order = [([params[:order], 0].max), project_task_group_count - 1].min
    puts new_order
    if tg.order.nil?
      tg.order = new_order
    else
      if new_order < tg.order # order going down
        tg_before = TaskGroup.find_by(project_id: tg.project_id, order: tg.order-1)
        unless tg_before.nil?
          tg_before.order += 1
          tg_before.save
        end
      else # order going up
        tg_after = TaskGroup.find_by(project_id: tg.project_id, order: tg.order+1)
        unless tg_after.nil?
          tg_after.order -= 1
          tg_after.save
        end
      end
      tg.order = new_order
    end
    tg.save
    render json: tg
  end

  # DELETE /task_groups/1 or /task_groups/1.json
  def destroy
    @task_group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_group
      @task_group = TaskGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_group_params
      params.require(:task_group).permit(:name, :project_id, :color, :order)
    end
end
