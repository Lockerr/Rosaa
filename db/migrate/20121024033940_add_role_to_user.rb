class AddRoleToUser < ActiveRecord::Migration
  def change
  	add_column :users, :role, :smallint, :default => 0
  end
end
