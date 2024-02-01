class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :region
  belongs_to :shipping_day
  belongs_to :status

  belongs_to :user
  has_one_attached :image

  validates :image, :item_name, :explanation, :price, presence: true
  validates :category_id, :charge_id, :region_id, :shipping_day_id, :status_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は¥300から¥9,999,999の範囲で設定してください' }
  validates :price, numericality: { only_integer: true, message: "は半角数値のみ入力してください" }
end
