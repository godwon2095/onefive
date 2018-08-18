# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if AdminUser.nil?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end
# 50.times do Post.create(user_id: 1, title: "hello", subtitle: "hello2", content: "wawafsdfdsfdsfs")
# end
Singer.generate_singers
Song.generate_songs
