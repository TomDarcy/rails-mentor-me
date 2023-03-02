class ReviewsController < ApplicationController
  def create
    @review = @mentor.bookings.build(booking_params)
    if @booking.save
      redirect_to mentor_path(@mentor), notice: 'Booking was successfully created.'
    else
      # send home
      redirect_to mentor_path(@mentor), notice: 'Booking was not created.'
    end
  end
    @review = Review.new(set_params)
  end


end
