require 'service_objects/web_service'

class AccountsController < ApplicationController

  def show
    @account = WebService.get_account_for_user(params[:id])
  end


end
