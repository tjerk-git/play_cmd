class AddVersionTwoChanges < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :color, :string
    add_column :posts, :publish_at, :datetime
    add_column :posts, :temporary, :boolean ## THIS SHOULD DO THE TRICK FOR TMP POSTS
    add_column :posts, :unpublished_at, :datetime ## OKAY SO THIS SHOULD DO THE TRICK FOR TMP POSTS
  end
end
