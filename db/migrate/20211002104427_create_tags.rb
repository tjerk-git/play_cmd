class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.integer :tag_id
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
