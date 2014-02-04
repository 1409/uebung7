class TaksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_tak, only: [:edit, :update, :destroy]

  # GET /taks
  # GET /taks.json
  def index
    if params[:sorting]
      @done = Tak.where(done: true).order(params[:sorting] => :desc)
      @todo = Tak.where(done: false).order(params[:sorting] => :desc)
    else
      @done = Tak.where(done: true).order(created_at: :desc)
      @todo = Tak.where(done: false).order(updated_at: :desc)
    end
  end

  # GET /taks/1
  # GET /taks/1.json

  # GET /taks/new
  def new
    @tak = Tak.new
  end

  # GET /taks/1/edit
  def edit
  end

  # POST /taks
  # POST /taks.json
  def create
    @tak = current_user.taks.new(tak_params)

    respond_to do |format|
      if @tak.save
        format.html { redirect_to taks_url, notice: 'Task was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @tak.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taks/1
  # PATCH/PUT /taks/1.json
  def update
    respond_to do |format|
      if @tak.update(tak_params)
        format.html { redirect_to taks_url, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tak.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taks/1
  # DELETE /taks/1.json
  def destroy
    @tak.destroy
    respond_to do |format|
      format.html { redirect_to taks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tak
      @tak = Tak.find(params[:id])
      if @tak.user_id != current_user.id && @tak.delegated_id != current_user.id
        redirect_to taks_url, alert: 'You can edit only your own Tasks.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tak_params
      params.require(:tak).permit(:name, :deadline, :done, :duration, :delegated_id, :project_id)
    end
  end
