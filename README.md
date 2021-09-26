# README
Repo for playground for MIJNCMD
Monolith Rails Application with Vue sprinkles where needed

# MVP
- [x] User moet kunnen registeren
- [x] User moet kunnen inloggen
- [x] User moet een profiel foto kunnen instellen
- [x] User moet een post kunnen maken
- [ ] User moet feedback op post kunnen ontvangen
- [ ] User moet kunnen browsen op tags
- [ ] User moet kunnen liken
- [ ] User krijgt email bij reacties op post


# Post
Media (gif, heic, jpeg)
Title
Slug
Cover
Body
Highlight
Likes

Has many tags

# User
Profile picture
Email
Password
Role

User has many Comments
User has many Posts
User has many Tags

# Skills
Belongs to User
Belongs to Post

# Comments
Belongs to User
Belongs to Post

// Ik sloop dit eruit want comments moeten over de post gaan.
Parent
Children


