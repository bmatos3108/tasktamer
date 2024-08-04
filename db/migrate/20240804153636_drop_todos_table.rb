class DropTodosTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :todos
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
