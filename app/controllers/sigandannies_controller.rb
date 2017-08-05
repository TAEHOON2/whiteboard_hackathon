class SigandanniesController < ApplicationController
  before_action :set_sigandanny, only: [:show, :edit, :update, :destroy]

  # GET /sigandannies
  # GET /sigandannies.json
  def index
    @sigandannies = Sigandanny.all
  end

  # GET /sigandannies/1
  # GET /sigandannies/1.json
  def show
  end

  # GET /sigandannies/new
  def new
    @sigandanny = Sigandanny.new
  end

  # GET /sigandannies/1/edit
  def edit
  end

  # POST /sigandannies
  # POST /sigandannies.json
  def create
    @sigandanny = Sigandanny.new(sigandanny_params)

    respond_to do |format|
      if @sigandanny.save
        format.html { redirect_to @sigandanny, notice: 'Sigandanny was successfully created.' }
        format.json { render :show, status: :created, location: @sigandanny }
      else
        format.html { render :new }
        format.json { render json: @sigandanny.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sigandannies/1
  # PATCH/PUT /sigandannies/1.json
  def update
    respond_to do |format|
      if @sigandanny.update(sigandanny_params)
        format.html { redirect_to @sigandanny, notice: 'Sigandanny was successfully updated.' }
        format.json { render :show, status: :ok, location: @sigandanny }
      else
        format.html { render :edit }
        format.json { render json: @sigandanny.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sigandannies/1
  # DELETE /sigandannies/1.json
  def destroy
    @sigandanny.destroy
    respond_to do |format|
      format.html { redirect_to sigandannies_url, notice: 'Sigandanny was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sigandanny
      @sigandanny = Sigandanny.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sigandanny_params
      params.require(:sigandanny).permit(:userid1, :userid2, :userid3, :userid4, :userid5, :userid6, :userid7, :userid8, :userid9, :userid10)
    end
end
