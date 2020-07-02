class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favs = @user.all_favorites
    @parks = []
    @favs.each do |fav|
      @parks << Park.find(fav.favoritable_id)
    end
    authorize @user
  end
end
