class PhotosController < ApplicationController
  before_filter :get_album

  def new
    @photo = Photo.new
  end

  def create
    if @album.photos.count <= 25
      @photo = @album.photos.build(photo_params)
      if @photo.save
        redirect_to album_path(@album), notice: 'photo created'
      else
        render :new
      end
    else
      redirect_to album_path(@album), notice: 'Unable to create alubm phto alerdy u reached maximum photos'
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
