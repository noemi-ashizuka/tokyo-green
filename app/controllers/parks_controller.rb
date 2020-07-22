class ParksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :toggle_favorite]
  skip_after_action :verify_policy_scoped, only: [:index, :show]
  
  def index
    @parks = Park.all
    @parks = policy_scope(Park)
  end

  def show
    @park = Park.find(params[:id])
    @review = Review.new
    authorize @park
  end

  def new
      if !current_user.admin?
        raise Pundit::NotAuthorizedError
      else
        @park = Park.new
        authorize @park
      end
  end

  def create
    @park = Park.new(park_params)
    @park.admin = current_user
    authorize_create
    if @park.save
      redirect_to park_path(@park)
    else
      render :new
    end
  end
  
  def edit
    if !current_user.admin?
      raise Pundit::NotAuthorizedError
    else
      @park = Park.find(params[:id])
      authorize @park
    end
  end

  def update
    @park = Park.find(params[:id])
    authorize @park
    @park.update(park_params)
    redirect_to park_path(@park)
  end

  def toggle_favorite
    @park = Park.find_by(id: params[:id])
    current_user.favorited?(@park) ? current_user.unfavorite(@park) : current_user.favorite(@park)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
      authorize @park
  end


  private

  def park_params
    params.require(:park).permit(:name, :address, :opening_hours, :description, :best_season, :photo, facilities: [], attractions: [])
  end

  def authorize_create
    authorize @park if current_user.admin?
  end
end
