class ParksController < ApplicationController
  skip_after_action :verify_policy_scoped, only: [:index, :show]

  def index
    @parks = Park.all
    @parks = policy_scope(Park)
  end

  def show
    @park = Park.find(params[:id])
    authorize @park
  end

  def new
    if current_user.admin?
      @park = Park.new
      @park.user = current_user
      authorize @park
    else
      redirect_to parks_path
    end
  end

  def create
    @park = Park.new(park_params)
    authorize @park
    if @park.save
      redirect_to park_path(@park)
    else
      render :new
    end
  end

  private

  def park_params
    params.require(:park).permit(:name, :address, :opening_hours, :description, :facilities, :attractions, :best_season)
  end
end
