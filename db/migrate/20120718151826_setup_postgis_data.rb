class SetupPostgisData < ActiveRecord::Migration
  def up
#    create_table :geometry_columns do |t|
      #t.string :f_table_catalog
      #t.string :f_table_schema
      #t.string :f_table_name
      #t.string :f_geometry_column
      #t.integer :coord_dimension
      #t.integer :srid
      #t.string :type, :size => 30
 #   end

  #  create_table :spatial_ref_sys do |t|
      #t.integer :srid
      #t.string :auth_name
      #t.integer :auth_srid
      #t.string :srtext
      #t.string :proj4text
   # end
  end

  def down
    #drop_table :geometry_columns
    #drop_table :spatial_ref_sys
  end
end
