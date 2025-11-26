class AddViewsCountToPets < ActiveRecord::Migration[8.0]
  def change
    add_column :pets, :views_count, :integer,default: 0
  end
end
