class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :region
  belongs_to :shipping_day
  belongs_to :status

  belongs_to :user
  has_one_attached :image

  
end
