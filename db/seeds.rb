# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#
AdminUser.create!(email: 'onefive@admin.com', password: 'onefive123!', password_confirmation: 'onefive123!')
Singer.generate_singers
Song.generate_songs
