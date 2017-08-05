class DanniesController < ApplicationController
  def new
    @danny = Danny.new
    @currentgwamokid = params[:currentgwamokid]
  end

  def show
  end
end
