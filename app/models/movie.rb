class Movie < ApplicationRecord

  mount_uploader :upload_image, ImageUploader

  has_many :reviews

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: {only_integer: true}
  validates :description, presence: true
  validates :upload_image, presence: true
  validates :release_date, presence: true

  validate :release_date_in_the_past

  def review_average
    reviews.size > 0 ? reviews.sum(:rating_out_of_ten)/reviews.size : "This movie has no reviews yet"
  end

  private

  def release_date_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end
