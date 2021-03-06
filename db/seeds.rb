# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "Example",
	email: "example@rails.org",
	password: "thanhbk",
	password_confirmation: "thanhbk",
	admin: true,
	activated: true,
	activated_at: Time.zone.now,
	age: 18
	)
99.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@rails.org"
	password = "thanhbk"
	User.create!(name: name,
		email: email,
		password: password,
		password_confirmation: password,
		activated: true,
		activated_at: Time.zone.now,
		age: n+1)
end
users = User.order(:created_at).take(6)
50.times do
	content = Faker::Lorem.sentence(5)
users.each {|user| user.posts.create!(content: content)}
end

#Following relationships
 users = User.all
 user = users.first
 following = users[2..50]
 followers = users[3..40]
 following.each {|followed| user.follow(followed)}
 followers.each {|follower| follower.follow(user)}