class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.date :date
      t.string :who
      t.string :what
      t.string :initial_meet_location
      t.float :latitude
      t.float :longitude
      t.datetime :fake_call
      t.string :how_did_it_go

      t.timestamps
    end
  end
end
