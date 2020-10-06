class Address < ApplicationRecord
  belongs_to :purchase

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  
  
end
