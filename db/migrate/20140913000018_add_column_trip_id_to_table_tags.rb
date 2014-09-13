class AddColumnTripIdToTableTags < ActiveRecord::Migration
  def change
    add_column :tags, :trip_id, :integer
  end
end
