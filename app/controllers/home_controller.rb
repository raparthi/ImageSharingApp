class HomeController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show
    if user_signed_in?
      redirect_to dashboard_path
    else
      @photos = Photo.limit(25)
    end
  end
end
