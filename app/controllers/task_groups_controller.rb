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
    task_group = TaskGroup.new({ project_id: params[:project_id] })
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

  # DELETE /task_groups/1 or /task_groups/1.json
  def destroy
    @task_group.destroy

    respond_to do |format|
      format.html { redirect_to task_groups_url, notice: "Task group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_group
      @task_group = TaskGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_group_params
      params.require(:task_group).permit(:name, :project_id, :color)
    end
end
