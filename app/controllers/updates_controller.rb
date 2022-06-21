class UpdatesController < ApplicationController
  before_action :set_update, only: %i[ show edit update destroy ]
  before_action :set_form_vars, only: %i[ show edit update destroy ]

  # GET /updates or /updates.json
  def index
    updates = Update.all
    render json: updates
  end

  # GET /updates/1 or /updates/1.json
  def show
  end

  # GET /updates/new
  def new
    @update = Update.new
    # if params[:project].empty? 
    #   @update_groups = UpdateGroup.all
    # else
    #   project = Project.find(:first, :conditions => { :id => params[:project] })
    #   @update_groups = project.update_groups
    # end
  end

  # GET /updates/1/edit
  def edit
  end

  # POST /updates or /updates.json
  def create
    @update = Update.create(update_params)
    if @update.save
      render json: @update
    else
      render json: @update.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /updates/1 or /updates/1.json
  def update
    @update = Update.find(params[:id])
    @update.update(update_params)
    render json: @update
  end

  # DELETE /updates/1 or /updates/1.json
  def destroy
    @update.destroy
    render json: @update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update
      @update = Update.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def update_params
      params.require(:update).permit(:content, :task_id, :user_id)
    end
end
