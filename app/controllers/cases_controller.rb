require 'service_objects/web_service'
class CasesController < ApplicationController

  def show
  end

  def index
    @cases = WebService.get_all_cases
  end

end
