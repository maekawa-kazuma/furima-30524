class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash (:category, :state, :burden, :area, :day)
  with_options  presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :price
    validates :image
  end
end
