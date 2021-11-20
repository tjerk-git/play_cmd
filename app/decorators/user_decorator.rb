class UserDecorator
  attr_reader :user, :view_context

  delegate :first_name, :last_name, to: :user

  def name
    "#{first_name} #{last_name}"
  end
end