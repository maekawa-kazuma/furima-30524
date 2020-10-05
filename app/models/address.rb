class Address < ApplicationRecord
  belongs_to :purchase

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  
  with_options presence: true do
    validates :postal_code, format: {with: VALID_POSTAL_CODE_REGEX }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number, format: {with: VALID_PHONE_NUMBER_REGEX}
  end
end
