require 'service_objects/web_service'

class UsersController < ApplicationController
  def new
    @user = User.new(name: nil)
  end

  def create
    # you'll want to byebug this and see how the ajax information comes in, then figure out how to send the name to the post_new_user
    @user= WebService.post_new_user(params[:name])
    # instead of a redirect you'll want to render :json some kind of thing back if successful
    render :json => params[:name]
  end

  def index
    @users = WebService.get_all_users
    @user = User.new(name: nil)
  end

  def show
    @user_id = params[:id]
    @user= WebService.get_single_user(@user_id)
  end

  def edit
    @user_id = params[:id]
    @user= WebService.get_single_user(@user_id)
  end

  def update
    @user_id = params[:id]
    @new_name = params[:name]
    @user = WebService.put_update_user(@user_id, @new_name)
    render :json => @new_name
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end
