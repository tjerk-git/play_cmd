class AddLinksToUserMigration < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :twitter_username, :string, null: true
    add_column :users, :github_username, :string, null: true
    add_column :users, :dribbble_url, :string, null: true
    add_column :users, :linkedin_url, :string, null: true
    add_column :users, :website_url, :string, null: true
  end
end
