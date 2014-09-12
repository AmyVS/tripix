class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.text :description
      t.integer :user_id
    end
  end
end
