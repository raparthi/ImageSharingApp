class DashboardController < ApplicationController
  def show
    @albums = current_user.albums
  end
end
