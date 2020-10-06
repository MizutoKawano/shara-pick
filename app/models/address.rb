class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :item
  belongs_to :user
  
  belongs_to_active_hash :arium

  validates :arium_id, numericality: { other_than: 1 }


  with_options presence: true do
    post_word = /\A\d{3}[-]\d{4}\z/

    
    validates :arium
    validates :city
    validates :house_number
    validates :tellnumber, length: { maximum: 11 }
    validates :postnumber,  format: { with: /#{post_word}/ }
    validates :user
    validates :item
      
  end
end
