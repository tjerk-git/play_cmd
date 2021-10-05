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