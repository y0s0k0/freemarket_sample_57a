class Home < ApplicationRecord
    # has_many :items
    # has_many :item_images
    has_ancestry
    enum condition: {brand_new: 0, near_unused: 1, no_noticeable_dirt: 2, somewhat_dirty: 3, dirty: 4, bad_condition: 5}
    enum delivery_schedule: {one_to_two_days: 0, two_to_three_days: 1, four_to_seven_days: 2}
    enum postage: {postage_included: 0, cash_on_delivery: 1}
end
