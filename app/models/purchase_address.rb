class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: VALID_POSTAL_CODE_REGEX }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number, format: {with: VALID_PHONE_NUMBER_REGEX}
  end
  def save
    user = User.all
    purchase = Purchase.create(user_id: currrent_user.id, item_id: params[item_id])
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end