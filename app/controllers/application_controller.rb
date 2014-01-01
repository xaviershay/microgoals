class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sketch
    client = Tenarms::Client.new(params[:id])
    @squat_max = client.max_lift("FrontSquat")
    render text: "YOUR SQUAT MAX IS: #{@squat_max.inspect}"
  end
end
