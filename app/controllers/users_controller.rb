require 'service_objects/web_service'

class UsersController < ApplicationController
  # before_action :get_user_account, only [:show]
  # before_action :get_user_account, only :show
  before_action :get_user, only: [:show, :edit]
  before_action :new_user, only: [:new, :index]

  def new
  end

  def create
    @user = WebService.post_new_user(params[:user])
    render :json => @user
  end

  def index
    @users = WebService.get_all_users
  end

  def show
    @account = WebService.get_account_for_user(1)
  end

  def edit
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
    params.require(:user).permit(:first_name, :last_name)
  end
end
