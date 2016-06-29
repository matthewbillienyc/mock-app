require 'service_objects/web_service'

class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @users = WebService.get_all_users
  end
end
