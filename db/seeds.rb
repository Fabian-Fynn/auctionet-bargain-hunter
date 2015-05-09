# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.new({email: "a@a.aa", password: "11111111", password_confirmation: "11111111" })
u2 = User.new({email: "b@b.bb", password: "11111111", password_confirmation: "11111111" })
u3 = User.new({email: "c@c.cc", password: "11111111", password_confirmation: "11111111" })
u1.save!
u2.save!
u3.save!
