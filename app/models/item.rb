class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1 }
    validates :state_id, numericality: { other_than: 1 }
    validates :burden_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }
    validates :price, format: { with: VALID_PRICE_REGEX }, numericality: { less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300 }
    validates :image
  end
end
