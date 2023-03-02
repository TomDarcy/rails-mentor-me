class MentorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @mentors = Mentor.all
    @mentors = @mentors.where(country: params[:country]) if params[:country].present?
    # @countries = @mentors.pluck(:country).uniq
    @mentors = @mentors.where(field: params[:field]) if params[:field].present?
    # @fields = @mentors.pluck(:field).uniq
    @mentors = @mentors.where("experience >= ?", params[:experience]) if params[:experience].present?
    @mentors = @mentors.where("price_per_hour <= ?", params[:price_per_hour]) if params[:price_per_hour].present?
  end

  def new
    @mentor = Mentor.new
  end

  def become_mentor
    current_user.update_attribute(:mentor, true)
    Mentor.create(user_id: current_user.id)
    mentor = Mentor.find_by_user_id(current_user.id)
    redirect_to edit_mentor_path((mentor))
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
