class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.string :subject
      t.text :body
      t.integer :votes

      t.timestamps
    end
  end
end
