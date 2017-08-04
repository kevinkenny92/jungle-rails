class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  # validate :
 validates :product, presence: true
 validates :user, presence: true
 validates :description, presence: true
 validates :rating, presence: true
end