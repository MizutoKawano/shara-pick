class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :item, class_name: "User"


end
