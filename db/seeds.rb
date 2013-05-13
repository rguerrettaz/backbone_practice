# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


me = User.create(username: "ryan", email: "rg@rg.com", password: 'bullshit')
(1..10).each do |int|
  tut = Tutorial.new(title: "test#{int}", content: "body of test#{int}")
  tut.user = me
  tut.save
end
