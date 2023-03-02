class ReviewsController < ApplicationController
  before_action :set_booking, only: [:create]
  def create
    @review = @booking.reviews.build(review_params)
    if @review.save
      redirect_to bookings_path, notice: 'Review was successfully created.'
    else
      render 'mentors/index', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:review, :rating).merge(booking: @booking)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
