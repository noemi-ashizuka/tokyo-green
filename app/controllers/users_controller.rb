class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favs = @user.all_favorites
    @reviews = @user.reviews
    @suggestion = Suggestion.new
    @parks = []
    @favs.each do |fav|
      @parks << Park.find(fav.favoritable_id)
    end
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to user_path
  end

  def admin_dashboard
    @user = current_user
    @facilities = Facility.all
    @facility = Facility.new
    if !@user.admin?
      raise Pundit::NotAuthorizedError
    else
      authorize @user
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :photo)
  end
end
