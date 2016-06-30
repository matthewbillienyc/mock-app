require 'service_objects/web_service'
class CasesController < ApplicationController

  def show
  end

  def index
    @cases = WebService.get_all_cases
  end

  def all_by_user
    @user_id = params[:id]
    @user = WebService.get_single_user_by(@user_id)
    @cases = WebService.get_all_cases_by_user(@user_id)
  end

  def new
  end

  def create
  end

end
