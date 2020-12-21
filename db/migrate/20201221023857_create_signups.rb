class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.bigint :event_id, foreign_key: true
      t.string :email

      t.timestamps
    end
    add_index :signups, [:event_id, :email], unique: true
    add_foreign_key :signups, :events, on_delete: :cascade
  end
end
