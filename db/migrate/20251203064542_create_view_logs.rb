class CreateViewLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :view_logs do |t|
      t.references :pet, null: false, foreign_key: true
      t.date :viewed_on

      t.timestamps
    end
  end
end
