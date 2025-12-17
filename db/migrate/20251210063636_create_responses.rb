class CreateResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :responses do |t|
      t.references :survey, null: false, foreign_key: true
      t.integer :total_score
      t.string :result

      t.timestamps
    end
  end
end
