class User < ApplicationRecord
  # after_save :create_a_mentor
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :bookings

  def create_a_mentor
    not_exist = Mentor.find_by_user_id(id).nil?
    if mentor? && not_exist
      @mentor = Mentor.create(user_id: id)
    end
    # go to mentors edit page
    # redirect_to edit_mentor_path(@mentor.id)
  end
end
