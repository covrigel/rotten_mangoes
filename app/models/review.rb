class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user, presece: true
  validates :movie, presence: true
  validates :text, presence: true
  validates :rating_out_of_ten, numericality: {only_integer: true, greater_tha_or_equal_to: 1, less_than_or_equal_to: 10}

end
