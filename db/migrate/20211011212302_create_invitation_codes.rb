class CreateInvitationCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :invitation_codes do |t|
      t.string :code
      t.date :due_at

      t.timestamps
    end
  end
end
