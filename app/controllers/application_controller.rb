class ApplicationController < ActionController::Base
  before_filter :set_side_color
  before_action :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # GET /set_side
  def set_side
    @side = params[:side]
    cookies[:side] = @side
    render nothing: true
  end

  # GET /set_language
  def set_language
    @language = params[:language]
    cookies[:language] = @language
    render nothing: true
  end

  private

  def set_side_color
      @side_color = cookies[:side]
  end

  def set_locale
    I18n.locale = cookies[:language] || extract_locale_from_accept_language_header
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

end
