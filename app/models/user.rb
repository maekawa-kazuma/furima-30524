class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_NAME_READ_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_read, presence: true, format: { with: VALID_NAME_READ_REGEX }
  validates :first_name_read, presence: true, format: { with: VALID_NAME_READ_REGEX }
  validates :birth_date, presence: true
  validates :email, uniqueness: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true
end
