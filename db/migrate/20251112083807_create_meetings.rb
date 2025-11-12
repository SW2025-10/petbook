class CreateMeetings < ActiveRecord::Migration[8.0]
  def change
    create_table :meetings do |t|
      t.string :customer_name
      t.datetime :meeting_datetime
      t.string :email
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
