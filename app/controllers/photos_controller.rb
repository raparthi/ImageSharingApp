class PhotosController < ApplicationController
  before_filter :get_album
  def new
    @photo = Photo.new
  end

  def create

  end
  private
  def get_album
    @album = Album.friendly.find(params[:id])
  end
end
