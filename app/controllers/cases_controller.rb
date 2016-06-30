require 'service_objects/web_service'
class CasesController < ApplicationController

  def show
  end

  def index
    @cases = WebService.get_all_cases
  end

  def all_by_user
    byebug
    @user_id = params[:id]
    @cases = WebService.get_all_cases_by_user(@user_id)
  end

end
