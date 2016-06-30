require 'service_objects/web_service'
class CasesController < ApplicationController

  def show
    @case_id = params[:id]
    @case = WebService.get_single_case_by(@case_id)
    @user = WebService.get_single_user_by(@case.user_id.to_s )
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
