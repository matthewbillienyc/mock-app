require 'service_objects/web_service'
class SessionController < ApplicationController
  def new
  end

  def create
    response = WebService.logon(params[:email], params[:password])
    if response["status"] == "success"
      logon(params[:email])
      set_role(response['role'])
      redirect_to popsicles_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete("email")
    redirect_to root_path
  end
end
