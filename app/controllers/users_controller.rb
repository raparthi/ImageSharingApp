class UsersController < HomeController
  before_filter :get_user
  def show
   @albums = @user.albums
  end
  private
  def get_user
    @user = User.friendly.find(params[:id])
    @users = User.all
  end
end
