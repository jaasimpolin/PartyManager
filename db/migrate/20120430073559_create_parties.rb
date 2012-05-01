class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.date :date
      t.string :location
      t.string :start_time
      t.string :end_time
      t.string :desc
      t.string :rsvp_date
      t.integer :host_id

      t.timestamps
    end
  end
end
