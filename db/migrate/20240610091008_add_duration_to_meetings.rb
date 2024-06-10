class AddDurationToMeetings < ActiveRecord::Migration[7.1]
  def change
    add_column :meetings, :duration, :integer
  end
end
