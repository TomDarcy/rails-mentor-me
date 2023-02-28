class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
  end

  def show
    @mentor = Mentor.find(params[:id])
    @booking = Booking.new
  end

  def create_booking
    @mentor = Mentor.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.mentor = @mentor

    if @booking.save
      redirect_to @mentor, notice: 'Booking was successfully created.'
    else
      render :show
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :description)
  end
end
