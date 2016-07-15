require 'service_objects/web_service'

class PopsiclesController < ApplicationController
  before_action :check_logged_on, only: [:index]

  def index
    popsicles = WebService.get_popsicle_summaries(session[:email])
    byebug
    # make a view that has a table that displays all popsicle summaries! also this controller
    # action should be protected unless user is signed on hence the before_action
  end
end
