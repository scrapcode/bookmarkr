class DashboardController < ApplicationController
  before_filter :signed_in_user, only: :show_user_tags
  
  def index
    if signed_in?
      @marks = current_user.marks.order("created_at DESC")
    else
      render 'lander'
    end
  end
  
  def lander
  end
end
