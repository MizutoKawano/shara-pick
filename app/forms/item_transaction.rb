class ItemTransaction
  include ActiveModel::Model
  attr_accessor :arium_id, :city, :house_number, :tellnumber, :postnumber, :building_name, :item_id, :user_id, :token

  with_options presence: true do
    
    post_word = /\A\d{3}[-]\d{4}\z/

    
    validates :arium_id,        numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :building_name
    validates :token
    validates :tellnumber,      length: { maximum: 11 }
    validates :postnumber,      format: { with: /#{post_word}/ }
    
  end
def save
  Payment.create(user_id: user_id, item_id: item_id)
  Address.create(arium_id: arium_id, city: city, house_number: house_number, building_name: building_name, tellnumber: tellnumber, postnumber: postnumber, user_id: user_id, item_id: item_id)
end
end