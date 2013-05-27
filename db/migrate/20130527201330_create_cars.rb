class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :car_model
      t.string :number
      t.string :color
      t.integer :driver_id

      t.timestamps
    end
  end
end
