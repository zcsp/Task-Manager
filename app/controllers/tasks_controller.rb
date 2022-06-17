class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_form_vars, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    tasks = Task.all
    render json: tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @user_name = @task.user && @task.user.name || 'Unassigned'
    @task_group = @task.task_group
    @project = @task_group.project
  end

  # GET /tasks/new
  def new
    @task = Task.new
    # if params[:project].empty? 
    #   @task_groups = TaskGroup.all
    # else
    #   project = Project.find(:first, :conditions => { :id => params[:project] })
    #   @task_groups = project.task_groups
    # end
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    task = Task.create(task_params)
    render json: task
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    task = Task.find(params[:id])
    task.update(
      {
        "start_date": task_params[:start_date].nil? ? nil : Date.strptime(task_params[:start_date], '%m/%d/%Y'),
        "end_date": task_params[:end_date].nil? ? nil : Date.strptime(task_params[:end_date], '%m/%d/%Y')
      }
    )
    render json: task
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    render json: @task
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_form_vars
      @users = User.all || []
      @projects = Project.all || []
      @task_groups = TaskGroup.all || []
      @statuses = Status.all || []
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :description, :start_date, :end_date, :status_id, :task_group_id, :user_id)
    end
end
