class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    email = params[:email]
    username = params[:username]
    password = params[:password]

    user = User.find_by email: email
      if (user) && (user.authenticate password)
        session[:user_id] = user.id
        redirect_to dashboard_path
      else
        flash.now[:danger] = "Please try again."
      end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path, notice: "You're all signed out!"
  end

end
