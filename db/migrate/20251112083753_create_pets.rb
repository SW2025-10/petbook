class CreatePets < ActiveRecord::Migration[8.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :price
      t.date :birthday
      t.string :label
      t.text :comment

      t.timestamps
    end
  end
end
