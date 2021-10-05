# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# posts = Post.create(title: 'First post', tags:)

tag = Tag.create(name: 'Branding')
tag = Tag.create(name: '3D')
tag = Tag.create(name: 'Website')
tag = Tag.create(name: 'UI/UX')
tag = Tag.create(name: 'Blender')

user = User.new(
    :email                 => "tjerk.dijkstra@nhlstenden.com",
    :name                  => "Tjerk Dijkstra",
    :password              => "12345678",
    :password_confirmation => "12345678",
    :role                  => 1
)
user.skip_confirmation!
user.save!

user = User.new(
    :email                 => "nordy.vlasman@student.nhlstenden.com",
    :name                  => "Nordy Vlasman",
    :password              => "12345678",
    :password_confirmation => "12345678",
    :role                  => 0
)
user.skip_confirmation!
user.save!

# tag = Tag.create(name: 'Web Design')
# tag = Tag.create(name: 'UI/UX')
# tag = Tag.create(name: 'Blender')
# tag = Tag.create(name: 'Programmeren')
# tag = Tag.create(name: 'HTML/CSS')
# tag = Tag.create(name: 'SCSS/Sass')
# tag = Tag.create(name: 'PHP')
# tag = Tag.create(name: 'Javascript')
# tag = Tag.create(name: 'Vue')
# tag = Tag.create(name: 'Laravel')
# tag = Tag.create(name: 'React')
# tag = Tag.create(name: 'Python')
# tag = Tag.create(name: 'Java')
# tag = Tag.create(name: 'C')
# tag = Tag.create(name: 'Swift')
# tag = Tag.create(name: 'SwiftUI')
# tag = Tag.create(name: 'Mathlab')
# tag = Tag.create(name: 'Angular')
# tag = Tag.create(name: 'React')
# tag = Tag.create(name: 'Elixir')
# tag = Tag.create(name: 'Bootstrap')
# tag = Tag.create(name: 'Wordpress')
# tag = Tag.create(name: 'TailwindCSS')
# tag = Tag.create(name: 'Elementor')
# tag = Tag.create(name: 'Squarespace')
# tag = Tag.create(name: 'Webflow')
# tag = Tag.create(name: 'Kotlin')
# tag = Tag.create(name: 'Typescript')
# tag = Tag.create(name: 'Ubuntu')
# tag = Tag.create(name: 'Motion Design')
# tag = Tag.create(name: 'Logo Design')
# tag = Tag.create(name: 'Branding')
# tag = Tag.create(name: 'Grafisch Design')
# tag = Tag.create(name: 'Fotografie')
# tag = Tag.create(name: 'Campagne')
# tag = Tag.create(name: 'Styleboard')
# tag = Tag.create(name: 'Moodboard')
# tag = Tag.create(name: 'Conceptboard')
# tag = Tag.create(name: '3D Visualisatie')
# tag = Tag.create(name: 'Mixed Reality')
# tag = Tag.create(name: 'Storytelling')
# tag = Tag.create(name: 'Animeren')
# tag = Tag.create(name: 'Schetsen')
# tag = Tag.create(name: 'Scrum')
# tag = Tag.create(name: 'Concept Visualisatie')
# tag = Tag.create(name: 'Conceptontwikkeling')
# tag = Tag.create(name: 'Ondernemen')
# tag = Tag.create(name: 'Illustreren')
# tag = Tag.create(name: 'Onderzoek')
# tag = Tag.create(name: 'Filosofie')
# tag = Tag.create(name: 'Psychologie')
# tag = Tag.create(name: 'Rapid prototyping')
# tag = Tag.create(name: 'Digitaal minimalisme')
# tag = Tag.create(name: 'Duurzaamheid')
# tag = Tag.create(name: 'Milieu')
# tag = Tag.create(name: 'Diversiteit')
# tag = Tag.create(name: 'Waardecreatie')
# tag = Tag.create(name: 'Business Model')
# tag = Tag.create(name: 'Bedrijfsplan')
# tag = Tag.create(name: 'Marketing/ Sales')
# tag = Tag.create(name: 'Mindmap')
# tag = Tag.create(name: 'Sound Design')
# tag = Tag.create(name: 'Componeren')
# tag = Tag.create(name: 'Opnames')
# tag = Tag.create(name: 'Producing')
# tag = Tag.create(name: 'Mixing')
# tag = Tag.create(name: 'Editing')
# tag = Tag.create(name: 'Mastering')
# tag = Tag.create(name: 'Storyboarding')
# tag = Tag.create(name: 'Film')
# tag = Tag.create(name: 'Scripting')
# tag = Tag.create(name: 'Film')
# tag = Tag.create(name: 'Regie')
# tag = Tag.create(name: 'Camera/ Licht')
# tag = Tag.create(name: 'Geluid')
# tag = Tag.create(name: 'Montage')
# tag = Tag.create(name: 'Schrijven')
