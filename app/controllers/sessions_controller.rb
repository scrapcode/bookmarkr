class SessionsController < ApplicationController
  before_action :check_signed_in, except: :destroy
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:notice] = "Successful sign in."
      redirect_back_or root_path
    else
      flash.now[:error] = 'Invalid email/pass combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
  private
    def check_signed_in
      redirect_to root_url, notice: "You're already logged in though..." if signed_in?
    end
end
