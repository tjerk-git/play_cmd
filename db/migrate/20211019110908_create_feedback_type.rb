class CreateFeedbackType < ActiveRecord::Migration[6.1]
  def change
    create_table :feedback_types do |t|
      t.string :type_name
      t.string :color
      t.integer :points
      t.timestamps
    end

    add_column :comments, :type_id, :integer, null: true
  end
end
