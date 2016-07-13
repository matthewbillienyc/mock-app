require 'service_objects/web_service'
class CasesController < ApplicationController
  before_action :get_user, only: [:all_by_user]

  def show
    @case_id = params[:id]
    @case = WebService.get_single_case_by(@case_id.to_i)

    @user = WebService.get_single_user_by(@case.user_id.to_i)
  end

  def index
    @cases = WebService.get_all_cases
    @case = Case.new({})
  end

  def all_by_user
    @cases = WebService.get_all_cases_by_user(@user_id)
  end

  def new
  end

  def create
    @case = WebService.post_new_case(description: case_params[:description], user_id: 3)
    render :json => @case
  end

  def update
    @case_id = params[:id].to_i
    @new_desc = params[:description]
    @case = WebService.put_update_case(@case_id, @new_desc)
    render :json => @new_desc
  end

  private

  def case_params
    params.require(:case).permit(:description)
  end
end
