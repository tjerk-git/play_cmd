class CreateFeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :feeds do |t|
      t.integer :type_id, null: false
      t.string :type_name, null: false 
      t.integer :community_id, null: true
      t.timestamps
    end
  end
end
