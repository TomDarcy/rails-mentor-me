class BookingsController < ApplicationController
  before_action :set_mentor, only: [:create]

  def index
    # @mentee_bookings = Booking.where(user_id: current_user.id)
    # @mentor_bookings = Booking.where(mentor_id: current_user.id)
    mentor = Mentor.find_by_user_id(current_user.id)
    @mentor_bookings = Booking.where(mentor_id: mentor.id)
    @mentee_bookings = Booking.where(user_id: current_user.id)
  end

  def create
    @booking = @mentor.bookings.build(booking_params)

    # Check for conflicting bookings
    if Booking.where(mentor_id: @mentor.id)
              .where("(start_time <= ? AND end_time >= ?) OR (start_time <= ? AND end_time >= ?)",
                     @booking.start_time, @booking.start_time, @booking.end_time, @booking.end_time)
              .exists?
      redirect_to mentor_path(@mentor),
                  notice: 'Booking could not be created. There is already a booking at this time.'
    elsif @booking.save
      redirect_to mentor_path(@mentor), notice: 'Booking was successfully created.'
    else
      # send home
      redirect_to mentor_path(@mentor), notice: 'Booking was not created.'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_mentor
    @mentor = Mentor.find(params[:mentor_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :mentor_id, :start_time, :end_time, :description, :status).merge(user_id: current_user.id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
