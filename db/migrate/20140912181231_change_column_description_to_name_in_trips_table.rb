class ChangeColumnDescriptionToNameInTripsTable < ActiveRecord::Migration
  def change
    remove_column :trips, :description, :text
    add_column :trips, :name, :string
  end
end
