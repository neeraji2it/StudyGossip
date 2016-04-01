# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Admin.create(:email => 'admin@gmail.com', :password => 'qawsed!@#', :password_confirmation => 'qawsed!@#', :username => 'admin')
Semester.create(name: 1)
Semester.create(name: 2)
Semester.create(name: 3)
Semester.create(name: 4)
Semester.create(name: 5)
Semester.create(name: 6)
Semester.create(name: 7)
Semester.create(name: 8)
# semesters = [1,2,3,4,5,6,7,8]
# semesters.each{|d| Semester.where(:name => d).first_or_create}