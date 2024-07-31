class CreateActivityLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :activity_logs do |t|

      t.timestamps
    end
  end
end
