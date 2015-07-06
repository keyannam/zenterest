class UserController < ApplicationController
  before_action :auth_user!, except: [:new, :create]

  def auth_user!
    @user_id = session[:user_id]
    @current_user = User.find_by id: @user_id
      if @current_user.nil?
        redirect_to sign_in_path
      else
        user = User.find params[:id]
      end
    end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new params.require(:user).permit(:email, :username, :password, :password_confirmation)

      if user.save
        flash[:success] = "Welcome!"
        session[:user_id] = @user.id
        redirect_to @user
      else
        render :new
      end
  end

end
