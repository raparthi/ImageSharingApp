class PhotosController < ApplicationController
  before_filter :get_album
  def new
    @photo = Photo.new
  end

  def create
    @photo = @album.photos.build(photo_params)
    if @photo.save
      redirect_to dashboard_path, notice: 'photo created'
    else
      render :new
    end
  end
  private
  def get_album
    @album = Album.friendly.find(params[:album_id])
  end

  def photo_params
    params.require(:photo).permit(:image, :tag_line)
  end
end
