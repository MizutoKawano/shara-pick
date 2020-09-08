class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :arium
  belongs_to_active_hash :day
  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_many :likes
  has_one :address
  has_one :payment
  has_one :rental
  has_many :liked_users, through: :likes, source: :user


  validates :category_id, :status_id, :fee_id, :arium_id, :day_id, numericality: { other_than: 1 }


  with_options presence: true do
    validates :name
    validates :comment
    validates :category
    validates :status
    validates :fee
    validates :arium
    validates :day
    validates :price, inclusion: { in: (300..9_999_999) }
  end

end

