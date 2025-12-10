class AddResultPetsToResponses < ActiveRecord::Migration[8.0]
  def change
    add_column :responses, :result_pets, :string
  end
end
