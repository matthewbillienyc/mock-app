class NotesController < ApplicationController
  def get_notes
    response = WebService.get_notes(params[:email], params[:popsicle_serial_number])
    render json: response
  end

  def post_note
    response = WebService.post_note(params[:email], params[:popsicle_serial_number], params[:text], params[:importance])
    render json: response
  end
end