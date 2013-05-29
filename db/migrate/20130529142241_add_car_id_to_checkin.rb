class AddCarIdToCheckin < ActiveRecord::Migration
  def change
    add_column :checkins, :car_id, :integer, null: false
  end
end
