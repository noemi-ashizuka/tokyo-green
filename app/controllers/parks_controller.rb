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
      if !current_user.admin?
        redirect_to root_path
      else
        @park = Park.new
        authorize @park
      end
  end

  def create
    @park = Park.new(park_params)
    @park.user = current_user
    authorize_create
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

  def authorize_create
    authorize @park if current_user.admin?
  end
end
