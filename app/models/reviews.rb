class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  # validate :
end