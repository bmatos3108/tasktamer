class DropTodosTable < ActiveRecord::Migration[7.0]
  def up
    if table_exists?(:todos)
      drop_table :todos
    end
  end

  def down
    create_table :todos do |t|
      t.string :name
      t.timestamps
    end
  end
end
