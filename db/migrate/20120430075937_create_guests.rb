class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.integer :host_id
      t.string :name
      t.string :email
      t.integer :invite_code
      t.integer :expected_attendees
      t.integer :actual_attendees

      t.timestamps
    end
  end
end
