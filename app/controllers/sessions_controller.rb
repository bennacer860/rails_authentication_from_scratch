class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] =  "logged in!!"
    else
      redirect_to '/login'
      flash[:alert] = "error: can't log in "
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
    flash[:notice] = "logged out"
  end
end
