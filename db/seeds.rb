# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

u1 = Driver.create(login: '000', name: 'Oleg')
u1.cars.create(car_model: 'Honda')
u2 = Driver.create(login: '111', name: 'Denis')
u2.cars.create(car_model: 'Mazda')
u3 = Driver.create(login: '222', name: 'Sasha')
u3.cars.create(car_model: 'Opel')

