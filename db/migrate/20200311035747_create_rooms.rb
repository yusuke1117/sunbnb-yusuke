class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.string :home_type
      t.string :room_type
      t.string :gest_count
      t.string :bedroom_count
      t.string :bathroom_count
      t.float :price
      t.text :summary
      t.boolean :is_active
      t.string :address
      t.boolean :has_TV
      t.boolean :has_kitchen
      t.boolean :has_internet
      t.boolean :has_heating
      t.boolean :has_air_conditioning

      t.timestamps
    end
  end
end
