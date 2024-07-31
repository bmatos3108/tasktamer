class CreateSubtasks < ActiveRecord::Migration[7.1]
  def change
    create_table :subtasks do |t|

      t.timestamps
    end
  end
end
