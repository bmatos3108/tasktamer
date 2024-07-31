class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :deactivate]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to [:admin, @user], notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def deactivate
    @user.update(deactivated: true)
    redirect_to admin_users_url, notice: 'User was successfully deactivated.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :admin, :deactivated)
  end
end
