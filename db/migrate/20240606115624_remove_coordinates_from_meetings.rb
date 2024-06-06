class RemoveCoordinatesFromMeetings < ActiveRecord::Migration[7.1]
  def change
    remove_column :meetings, :latitude, :float
    remove_column :meetings, :longitude, :float
  end
end
