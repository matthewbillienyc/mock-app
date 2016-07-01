require 'service_objects/web_service'

class UsersController < ApplicationController
  # before_action :get_user_account, only [:show]
  before_action :get_user_account, only [:show]

  def new
    @user = User.new(name: nil)
  end

  def create
    @user= WebService.post_new_user(params[:name])
    render :json => params[:name]
  end

  def index
    @users = WebService.get_all_users
    @user = User.new(name: nil)
  end

  def show
    @user_id = params[:id]
    @user= WebService.get_single_user_by(@user_id)
  end

  def edit
    @user_id = params[:id]
    @user= WebService.get_single_user_by(@user_id)
  end

  def update
    @user_id = params[:id]
    @new_name = params[:name]
    @user = WebService.put_update_user(@user_id, @new_name)
    render :json => @new_name
  end

  def destroy
    #should our app be able to destroy records on the API?
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

  def get_user_account
    WebService.get_account_for_user(1)
  end

end
