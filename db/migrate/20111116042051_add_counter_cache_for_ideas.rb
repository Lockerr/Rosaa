class AddCounterCacheForIdeas < ActiveRecord::Migration
  def up
    add_column :ideas, :comments_count, :integer
  end

  def down
  end
end
