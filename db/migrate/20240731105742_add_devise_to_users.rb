class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def change
   # add_column :users, :email, :string
    #add_column :users, :encrypted_password, :string
   # add_column :users, :reset_password_token, :string
    #add_column :users, :reset_password_sent_at, :datetime
   # add_column :users, :remember_created_at, :datetime
     # Only add columns that are missing
     unless column_exists?(:users, :email)
      add_column :users, :email, :string, default: "", null: false
    end

    unless column_exists?(:users, :encrypted_password)
      add_column :users, :encrypted_password, :string, default: "", null: false
    end

    # Add other columns if needed and not already present
    add_column :users, :reset_password_token, :string unless column_exists?(:users, :reset_password_token)
    add_column :users, :reset_password_sent_at, :datetime unless column_exists?(:users, :reset_password_sent_at)
    add_column :users, :remember_created_at, :datetime unless column_exists?(:users, :remember_created_at)

    # Add indexes if they are not already present
    unless index_exists?(:users, :email)
      add_index :users, :email, unique: true
    end

    unless index_exists?(:users, :reset_password_token)
      add_index :users, :reset_password_token, unique: true
  end
end
end 
