class AddColoumsToUser < ActiveRecord::Migration
  def self.up
       add_column :users, :name, :string
       add_column :users, :hashed_pasword, :string
 
  end

  def self.down
           remove_column :users, :name
           remove_column :users, :hashed_pasword
  end
end
