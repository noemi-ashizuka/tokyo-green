class FacilitiesController < ApplicationController
  def new
    @facility = Facility.new
    authorize @facility
  end

  def create
    @facility = Facility.new(facility_params)
    authorize @facility
    if @facility.save
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :is_attraction)
  end
end
