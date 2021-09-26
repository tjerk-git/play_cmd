class AddForeignKeyToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :user_id, :integer, foreign_key: true, index: true
  end
end
