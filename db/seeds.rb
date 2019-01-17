# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

post1 = Post.create(title: "First Post", content: "I'm just a post")
post2 = Post.create(title: "Second Post", content: "Same here")

category1 = Category.create(name: "Horror")
category2 = Category.create(name: "Funny")

user1 = User.create(username: "Lucy", email: "lucy@flatiron.com")
user2 = User.create(username: "Ruth", email: "ruth@flatiron.com")

comment1 = Comment.create(content: "Excellent", user: user1, post: post1)
comment2 = Comment.create(content: "Really helpful", user: user2, post: post2)

postcategory1 = PostCategory.create(post: post1, category: category1)
postcategory2 = PostCategory.create(post: post2, category: category2)
