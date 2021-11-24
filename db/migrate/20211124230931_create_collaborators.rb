class CreateCollaborators < ActiveRecord::Migration[7.0]
  def change
    create_table :collaborators do |t|
      t.integer :type_id, null: false 
      t.integer :user_id, null: false
      t.string :type_name, null: false 

    #   Additional stuff
    #   t.string :collab_type, null: true # Team member etc tester etc.
      t.timestamps
    end
  end
end
