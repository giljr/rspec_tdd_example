class AddDefaultToViewsInPosts < ActiveRecord::Migration[8.0]
def up
    # Set existing NULL views to 0
    execute "UPDATE posts SET views = 0 WHERE views IS NULL"

    # Change the column to have default 0 and not allow nulls
    change_column :posts, :views, :integer, default: 0, null: false
  end

  def down
    # Revert column to previous state (nullable, no default)
    change_column :posts, :views, :integer, default: nil, null: true
  end
end
