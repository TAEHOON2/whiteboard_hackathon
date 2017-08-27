class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update] # probably want to keep using this
  # after_action :set_nickname
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # # GET /users/1
  # # GET /users/1.json
  def show

  end

  # GET /users/1/edit
  def edit

  end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
        # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
    
      def set_nickname
        @user = User.find(params[:id])
        @n = ["예쁜","목이 긴","착한","나쁜","엄청난","귀여운","못생긴"].sample(1).join(',')
        @q = ["민들레","기린","멋쟁이","못난이","귀염둥이","똘똘이","하마","공룡"].sample(1).join(',')
        @w = "#{@n + @q}"
        @user.update(nickname: @w)
      end
      
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:role, :user_name, :nickname)
      end
    
    def new
       @n = ["예쁜","목이 긴","착한","나쁜","엄청난","귀여운","못생긴"].sample(1).join(',')
       @q = ["민들레","기린","멋쟁이","못난이","귀염둥이","똘똘이","하마","공룡"].sample(1).join(',')
       @w = "#{@n + @q}"
    end
    
    def nicknamecreate
      User.create(nickname: params[:nickname])
      
    end
end


