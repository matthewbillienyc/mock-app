require 'service_objects/web_service'

class PopsiclesController < ApplicationController
  before_action :check_logged_on, only: [:index, :show, :rate]

  def index
    @popsicles = WebService.get_popsicle_summaries(session[:email])
    # make a view that has a table that displays all popsicle summaries! also this controller
    # action should be protected unless user is signed on hence the before_action
  end

  def show
    @notes = get_notes(params[:serial_number])
    @popsicle = WebService.get_popsicle_details(session[:email], params[:serial_number])
  end

  def rate
    response = WebService.rate_popsicle(session[:email], params[:serial_number], params[:rating], params[:response_text])
    render :json => response
  end
end
