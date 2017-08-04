class SipliesController < ApplicationController
  def create
    @sigan = Sigan.find(params[:sigan_id])
    @siply = @sigan.siplies.create(siply_params)
    redirect_to sigan_path(@sigan)
  end

  def destroy
    @sigan = Sigan.find(params[:sigan_id])
    @siply = @sigan.siplies.find(params[:id])
    @siply.destroy
    redirect_to sigan_path(@sigan)
  end

  private
    def siply_params
      params.require(:siply).permit(:reply_user, :body)
    end
  
end
