require 'service_objects/web_service'

class UsersController < ApplicationController
  def new
    @user = User.new(name: nil)
  end

  def create
    @user= WebService.post_new_user(user_params[:name])
    redirect_to users_path
  end

  def index
    @users = WebService.get_all_users
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end
