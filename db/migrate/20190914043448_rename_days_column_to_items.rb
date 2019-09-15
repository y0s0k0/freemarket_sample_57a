class RenameDaysColumnToItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :days, :delivery_schedule
  end
end
