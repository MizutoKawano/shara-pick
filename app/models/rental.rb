class Rental < ApplicationRecord

  belongs_to :item
  belongs_to :user



  with_options presence: true do

  validates :rental_start
  validates :rental_end
  validates :user
  validates :item
  end
end
