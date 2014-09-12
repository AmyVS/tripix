class CreatePicturesTake2 < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.integer :trip_id
      t.attachment :photo
    end
  end
end
