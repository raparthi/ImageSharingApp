class AlbumsController < ApplicationController
 def new
   @album = Album.new
 end

 def create
   @album = current_user.albums.build(album_params)
   if @album.save
     redirect_to dashboard_path, notice: 'Album Created'
   else
     render :new
   end
 end

 def show
   @album = Album.friendly.find(params[:id])
 end

 private
 def album_params
   params.require(:album).permit(:name)
 end
end
