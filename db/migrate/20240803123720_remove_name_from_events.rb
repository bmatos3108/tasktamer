class RemoveNameFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :name, :string
  end
end
