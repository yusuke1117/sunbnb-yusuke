class AddFieldsToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :latitube, :float
    add_column :rooms, :longtitube, :float

  end
end
