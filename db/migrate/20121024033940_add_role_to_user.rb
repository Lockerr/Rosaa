class AddRoleToUser < ActiveRecord::Migration
  def change
  	add_column :users, :role, :tinyint, :default => 0
  end
end
