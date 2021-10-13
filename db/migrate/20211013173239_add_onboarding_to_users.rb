class AddOnboardingToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :onboarding_seen, :boolean, default: false
  end
end
