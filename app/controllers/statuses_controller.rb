class StatusesController < ApplicationController
  before_action :set_status, only: %i[ show edit update destroy ]

  # GET /statuses or /statuses.json
  def index
    statuses = Status.all
    render json: statuses
  end

  # GET /statuses/1 or /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses or /statuses.json
  def create
    @status = Status.new(status_params)
    @status.save
  end

  # PATCH/PUT /statuses/1 or /statuses/1.json
  def update
    @status.update(status_params)
  end

  # DELETE /statuses/1 or /statuses/1.json
  def destroy
    @status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def status_params
      params.require(:status).permit(:name, :color)
    end
end
