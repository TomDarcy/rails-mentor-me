class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
    @mentors = @mentors.where(country: params[:country]) if params[:country].present?
    # @countries = @mentors.pluck(:country).uniq
    @mentors = @mentors.where(field: params[:field]) if params[:field].present?
    # @fields = @mentors.pluck(:field).uniq
    @mentors = @mentors.where("experience >= ?", params[:experience]) if params[:experience].present?
    @mentors = @mentors.where("price_per_hour <= ?", params[:price_per_hour]) if params[:price_per_hour].present?
  end

  def show
    @mentor = Mentor.find(params[:id])
  end
end
