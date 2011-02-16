class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :name
      t.string :email

      t.timestamps
    end
  end
  
  add_column :stories, :user_id, :integer
  add_column :votes, :user_id, :integer

  def self.down
    drop_table :users
    remove_column :stories, :user_id, :integer
    remove_column :stories, :user_id, :integer
  end
end
