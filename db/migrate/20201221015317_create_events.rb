class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :uid, null: false
      t.string :location, null: false
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false

      t.timestamps
    end
    add_index :events, :uid, unique: true
  end
end
