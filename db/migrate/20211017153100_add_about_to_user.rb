class AddAboutToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :about, :text, null: true
  end
end
