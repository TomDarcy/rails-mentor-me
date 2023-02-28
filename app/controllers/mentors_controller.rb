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

  def edit
    @mentor = Mentor.find(params[:id])
  end

  def update
    @mentor = Mentor.find(params[:id])
    if @mentor.update(mentor_params)
      redirect_to @mentor, notice: 'Mentor was successfully updated.'
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :description)
  end

  def mentor_params
    params.require(:mentor).permit(:bio, :field, :country, :price_per_hour, :experience)
  end
end
