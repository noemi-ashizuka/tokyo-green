class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
  end

  def create
    @park = Park.find(params[:park_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.park = @parkauthorize @review
    if @review.save
      redirect_to park_path(@park)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit.(:content, :rating)
  end
end
