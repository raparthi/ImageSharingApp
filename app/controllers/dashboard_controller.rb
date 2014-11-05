class DashboardController < ApplicationController
  def show
    @albums = current_user.albums
    @others_albums = Album.where.not(user_id: current_user.id).last(25);
  end
end
