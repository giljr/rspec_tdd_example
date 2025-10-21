class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.integer :views

      t.timestamps
    end
  end
end
