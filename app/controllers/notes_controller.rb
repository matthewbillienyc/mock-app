class NotesController < ApplicationController
  skip_before_action :authenticity_token, only: [:create]

  def create
    response = WebService.post_note(session[:email], params[:note])
    render json: response
  end
end
