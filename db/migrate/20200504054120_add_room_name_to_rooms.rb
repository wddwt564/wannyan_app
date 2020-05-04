class AddRoomNameToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :room_name, :string
    add_column :rooms, :genre, :string
  end
end
