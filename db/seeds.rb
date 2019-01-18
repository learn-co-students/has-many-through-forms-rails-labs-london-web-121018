# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.destroy_all
User.destroy_all
Category.destroy_all
PostCategory.destroy_all

p1 = Post.create({title: "FOOD FOOD", content:"ffffffffoooooooooddddddddddddd"})
p2 = Post.create({title: "Gym is life", content:"Chuck tin around and all that"})
p3 = Post.create({title: "Save Money", content:"Don't eat or drink or do anything"})
p4 = Post.create({title: "Clapham Common", content:"Big park people have fun there"})
p5 = Post.create({title: "How to lose a guy", content:"Cry constantlty"})

pc1 = PostCategory.create({post_id: 1, category_id: 1})
pc2 = PostCategory.create({post_id: 1, category_id: 3})
pc3 = PostCategory.create({post_id: 2, category_id: 1})
pc4 = PostCategory.create({post_id: 3, category_id: 2})
pc5 = PostCategory.create({post_id: 3, category_id: 1})
pc6 = PostCategory.create({post_id: 5, category_id: 3})

c1 = Category.create({name: "Life"})
c1 = Category.create({name: "Money"})
c1 = Category.create({name: "Social"})

cm1 = Comment.create({content:"I love Turtles", user_id: 1, post_id: 2})
cm2 = Comment.create({content:"But food is life", user_id: 2, post_id: 1})
cm3 = Comment.create({content:"Love it so relevant", user_id: 1, post_id: 5})
cm4 = Comment.create({content:"blah blah balh", user_id: 3, post_id: 3})
cm5 = Comment.create({content:"Yeah I lift to", user_id: 1, post_id: 4})
cm6 = Comment.create({content:"olacwbli", user_id: 4, post_id: 5})

u1 = User.create({username: "Tim_tan", email: "timmmmmmyyyyy@gmail.com"})
u2 = User.create({username: "Fatty", email: "fatfat@yahoo.com"})
u3 = User.create({username: "Ht", email: "harry.tuner@uwclub.net"})
u4 = User.create({username: "HoneyBooBoo", email: "hbb@gmail.com"})
