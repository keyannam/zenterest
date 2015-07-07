class ZensController < ApplicationController
  before_action :find_zen, only: [:show, :edit, :update, :destroy]

  def index
    @zens = Zen.all.order("created_at DESC")
  end

  def new
    @zen = Zen.new
  end

  def create
    @zen = Zen.new(zen_params)
    # @zen = @current_user

      if @zen.save
        redirect_to @zen, notice: "Successfully created new Zen!"
      else
        render 'new'
      end
  end

  def show
  end

  def destroy
    @zen.destroy
    redirect_to root_path
  end

  private

  def zen_params
    params.require(:zen).permit(:title, :photo, :description, :link, :user_id)
  end

  def find_zen
    @zen = Zen.find(params[:id])
  end
end
