class ChangeDatatypeDeliveryScheduleOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :delivery_schedule, :string
  end
end
