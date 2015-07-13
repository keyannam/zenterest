class PagesController < ApplicationController

  before_action :authenticate_user, only: [:dashboard]

  def index
      @zens = Zen.all.order("created_at DESC")
  end

end
