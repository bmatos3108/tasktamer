class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.datetime :due_date
      t.integer :priority
      t.datetime :reminder_at

      t.timestamps
    end
  end
end
