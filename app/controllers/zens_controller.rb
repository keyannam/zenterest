class ZensController < ApplicationController

  before_action do
    @current_user = User.find_by id: session[:user_id]
     if @current_user.nil?
       redirect_to sign_in_path
     end
 end

  def dashboard
    @zens = Zen.all.order("created_at DESC")
  end

  def new
    @zen = Zen.new
  end

  def create
    @zen = Zen.new(zen_params)
    @zen.user = @current_user
      if @zen.save
        redirect_to dashboard_path, notice: "You just zenned!"
      else
        render :new_zen_path, notice: "OOOPS, something went wrong, please try again."
      end

    @zens = Zen.all.order("created_at DESC")
  end

  def show
    @zen = Zen.find(params[:id])
  end

  def destroy
    @zen = Zen.find(params[:id])
    @zen.destroy
    redirect_to dashboard_path
  end

  private

  def zen_params
    params.require(:zen).permit(:title, :photo, :description, :link, :user_id)
  end

  def find_zen
    @zen = Zen.find(params[:id])
  end
end
