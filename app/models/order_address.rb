class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :block, :building, :phone_number, :token, :user_id, :item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code,   format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id,       numericality: { other_than: 0 }
    validates :token
    validates :city
    validates :block
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, area_id: area_id, city: city, block: block, building: building,
                   phone_number: phone_number)
  end
end
