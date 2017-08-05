class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @currentgwamokid = params[:currentgwamokid]
    @classname= Usergwamok.where(gwamokid: @currentgwamokid)
   
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @currentgwamok = params[:currentgwamokid]
  end

  # GET /posts/new
  def new
    @post = Post.new
    @currentgwamokid = params[:currentgwamokid]
  end

  # GET /posts/1/edit
  def edit
    @currentgwamokid = params[:currentgwamokid]
  end

  # POST /posts
  # POST /posts.json
  def create
    @currentgwamokid = params[:currentgwamokid]
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
        @currentgwamokid = params[:currentgwamokid]
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
        @currentgwamokid = params[:currentgwamokid]
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @currentgwamokid = params[:currentgwamokid]
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      @currentgwamokid = params[:currentgwamokid]
      params.require(:post).permit(:gwamokid, :username, :title, :body, :attachment, :category)
    end
end
