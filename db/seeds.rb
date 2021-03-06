# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# posts = Post.create(title: 'First post', tags:)
# InvitationCode.create(code: 'speenvarken-2021', due_at: "2021-12-31")

# user = User.new(
#     :email                 => "tjerk.dijkstra@nhlstenden.com",
#     :name                  => "Tjerk Dijkstra",
#     :password              => "12345678",
#     :password_confirmation => "12345678",
#     :invitation_code       => 'speenvarken-2021'
# )
# # user.skip_confirmation!
# user.save

# user = User.new(
#     :email                 => "nordy.vlasman@student.nhlstenden.com",
#     :name                  => "Nordy Vlasman",
#     :password              => "12345678",
#     :password_confirmation => "12345678",
#     :invitation_code        => 'speenvarken-2021',
# )
# # user.skip_confirmation!
# user.save


# Tag.create(name: 'Web Design')
# Tag.create(name: 'UI/UX')
# Tag.create(name: 'Motion Design')
# Tag.create(name: 'Logo Design')
# Tag.create(name: 'Branding')
# Tag.create(name: 'Photography')
# Tag.create(name: 'Visual')
# Tag.create(name: 'Moodboard')
# Tag.create(name: '3D')
# Tag.create(name: 'Storytelling')
# Tag.create(name: 'Animation')
# Tag.create(name: 'Concept')
# Tag.create(name: 'Prototype')
# Tag.create(name: 'Storyboarding')
# Tag.create(name: 'Film')
# Tag.create(name: 'Sound design')
# Tag.create(name: 'Writing')

FeedbackType.create(type_name: 'confusing', color: 'yellow', points: 5, description: "Not sure what you mean")
FeedbackType.create(type_name: 'details', color: 'pink', points: 10, description: "Give it some details")
FeedbackType.create(type_name: 'human', color: 'red', points: 50, description: "Think about your audience")
FeedbackType.create(type_name: 'iterative', color: 'yellow', points: 5, description: " ??\_(???)_/?? ")
FeedbackType.create(type_name: 'launch', color: 'red', points: 10, description: " ??\_(???)_/?? ")
FeedbackType.create(type_name: 'test', color: 'blue', points: 50, description: "Go do some testing!")
FeedbackType.create(type_name: 'variant', color: 'red', points: 50, description: " ??\_(???)_/?? ")
FeedbackType.create(type_name: 'sketch', color: 'red', points: 50, description: " ??\_(???)_/?? ")
