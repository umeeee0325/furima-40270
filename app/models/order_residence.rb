class OrderResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :house_number, :building_name, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :region_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: "must be 10 to 11 digits long" }
  end

  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create!(item_id: item_id, user_id: user_id)
    Residence.create!(postal_code: postal_code, region_id: region_id, city: city, house_number: house_number, building_name: building_name, telephone: telephone, order_id: order.id)
  end
end