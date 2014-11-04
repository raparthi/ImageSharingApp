class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  layout :layout_by_resource
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::InvalidAuthenticityToken, with: :session_destroy

  def layout_by_resource
    if signed_in?
      'application'
    else
      'home'
    end
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def record_not_found
    render "public/404", status: 404
  end

  def session_destroy
    redirect_to "/users/sign_in", notice: 'Sign In to continue'
  end
end
