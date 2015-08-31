class UsersController < ApplicationController
  def index
    @users= User.all
  end

  def new
    @user = User.new params[:user]
  end

  def create
    @user = User.new params_user
    if @user.save
      redirect_to root_path, notice: "Successfully created a user "
    else
      render :new
    end
  end

  private

  def params_user
    params.require(:user).permit :name,:email, :password, :password_confirmation
  end
end
