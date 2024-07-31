class CreateTaskCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :task_categories do |t|

      t.timestamps
    end
  end
end
