class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :song_name
      t.string :url
      t.references :user
      t.references :session

      t.timestamps
    end
  end
end
