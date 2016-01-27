class ApplicationController < ActionController::Base
  before_filter :set_side_color

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # GET /set_side
  def set_side
    @side = params[:side]
    cookies[:side] = @side
    render nothing: true
  end

  private

  def set_side_color
      @side_color = cookies[:side]
  end

end
