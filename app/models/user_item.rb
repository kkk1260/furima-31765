class UserItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token,
                :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates    :municipality
    validates    :address
    validates    :phone_number, format: { with: /\A\d{11}\z/ }
    validates    :token
  end

  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address,
                           building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
