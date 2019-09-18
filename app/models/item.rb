class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
  # belongs_to :category
  enum condition: {brand_new: 0, near_unused: 1, no_noticeable_dirt: 2, somewhat_dirty: 3, dirty: 4, bad_condition: 5}
  enum delivery_schedule: {one_to_two_days: 0, two_to_three_days: 1, four_to_seven_days: 2}
  enum postage: {postage_included: 0, cash_on_delivery: 1}
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
