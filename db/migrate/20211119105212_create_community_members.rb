class CreateCommunityMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :community_members do |t|
      t.belongs_to :user_id
      t.belongs_to :community_id

      t.timestamps
    end
  end
end
