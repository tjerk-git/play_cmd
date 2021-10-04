class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :post_id, :integer, unique: true
      t.string :title
      t.string :slug
      t.text :body
      t.integer :highlight
      t.integer :likes
      t.timestamps
    end
  end
end
