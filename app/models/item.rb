class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :region
  belongs_to :shipping_day
  belongs_to :status

  belongs_to :user
  has_one_attached :image

  validates :item_name, :explanation, :price, presence: true
  validates :category_id, :charge_id, :region_id, :shipping_day_id, :status_id, numericality: { other_than: 1 , message: "can't be blank"}
end
