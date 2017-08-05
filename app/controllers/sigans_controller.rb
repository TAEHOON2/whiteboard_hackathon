class SigansController < ApplicationController
  before_action :set_sigan, only: [:show, :edit, :update, :destroy]

  # GET /sigans
  # GET /sigans.json
  def index
    @sigans = Sigan.all
    @currentgwamokid = params[:currentgwamokid]
  end

  # GET /sigans/1
  # GET /sigans/1.json
  def show
    @currentgwamokid = params[:currentgwamokid]
  end

  # GET /sigans/new
  def new
    @sigan = Sigan.new
    @currentgwamokid = params[:currentgwamokid]
  end

  # GET /sigans/1/edit
  def edit
    @currentgwamokid = params[:currentgwamokid]
  end

  # POST /sigans
  # POST /sigans.json
  def create
    @currentgwamokid = params[:currentgwamokid]
    @sigan = Sigan.new(sigan_params)

    respond_to do |format|
      if @sigan.save
        format.html { redirect_to @sigan, notice: 'Sigan was successfully created.' }
        format.json { render :show, status: :created, location: @sigan }
      else
        format.html { render :new }
        format.json { render json: @sigan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sigans/1
  # PATCH/PUT /sigans/1.json
  def update
    @currentgwamokid = params[:currentgwamokid]
    respond_to do |format|
      if @sigan.update(sigan_params)
        format.html { redirect_to @sigan, notice: 'Sigan was successfully updated.' }
        format.json { render :show, status: :ok, location: @sigan }
      else
        format.html { render :edit }
        format.json { render json: @sigan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sigans/1
  # DELETE /sigans/1.json
  def destroy
    @sigan.destroy
     @currentgwamokid = params[:currentgwamokid]
    respond_to do |format|
      format.html { redirect_to sigans_url, notice: 'Sigan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sigan
      @currentgwamokid = params[:currentgwamokid]
      @sigan = Sigan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sigan_params
      @currentgwamokid = params[:currentgwamokid]
      params.require(:sigan ).permit(:gwamokid, :username, :title, :body, :attachment)
    end
    
end
