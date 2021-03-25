class FacilitiesController < ApplicationController
  # def new
  #   @facility = Facility.new
  #   authorize @facility
  # end

  def create
    @facility = Facility.new(facility_params)
    authorize @facility
    if @facility.save
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    authorize @facility
    redirect_back(fallback_location: root_path)
  end

  private

  def facility_params
    # TODO: add icon as photo for a facility
    params.require(:facility).permit(:name, :icon, :is_attraction)
  end
end
