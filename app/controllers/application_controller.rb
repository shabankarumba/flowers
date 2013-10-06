class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :locality

  def locality
    params[:country] ||= params[:country] = "GB"
    session[:country] = params[:country]
    set_locality_from_session
  end

  private

  def set_locality_from_session
    session[:country] ||= session[:country] = "GB"
    params[:country] = session[:country]
  end
end
