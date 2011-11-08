class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :phone, :string
    add_column :users, :second_name, :string
    add_column :users, :birthday, :date
    add_column :users, :nick, :string

  end
end
