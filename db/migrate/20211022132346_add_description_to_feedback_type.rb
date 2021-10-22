class AddDescriptionToFeedbackType < ActiveRecord::Migration[6.1]
  def change
    add_column :feedback_types, :description, :string
    change_column_null :comments, :type_id, true
  end
end
