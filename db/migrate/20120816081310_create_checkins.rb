class CreateCheckins < ActiveRecord::Migration
  def up
    create_table :checkins do |t|
      t.string :title
      t.point :location, :geographic => true
    end
    change_table :checkins do |t|
      t.index :location, :spatial => true
    end
  end

  def down
    drop_table :checkins
  end
end