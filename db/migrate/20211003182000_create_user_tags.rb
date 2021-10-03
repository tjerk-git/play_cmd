class CreateUserTags < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tags do |t|

      t.timestamps
    end
  end
end
