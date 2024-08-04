class CreateGroceries < ActiveRecord::Migration[7.1]
  def change
    create_table :groceries do |t|
      t.string :name
      t.integer :quantity
      t.string :category

      t.timestamps
    end
  end
end
