class CreateReminders < ActiveRecord::Migration[7.1]
  def change
    create_table :reminders do |t|
      t.references :user, null: false, foreign_key: true
      t.text :message
      t.datetime :reminder_at

      
      t.timestamps
    end
  end
end
