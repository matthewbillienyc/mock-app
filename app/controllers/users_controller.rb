require 'service_objects/web_service'

class UsersController < ApplicationController
  def new
    @user = User.new(name: nil)
  end

  def create
    # you'll want to byebug this and see how the ajax information comes in, then figure out how to send the name to the post_new_user
    @user= WebService.post_new_user(user_params[:name])
    # instead of a redirect you'll want to render :json some kind of thing back if successful
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
