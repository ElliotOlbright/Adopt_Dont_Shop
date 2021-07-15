# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Dealership and Cars Seed
Car.destroy_all
Dealership.destroy_all

dealer1 = Dealership.create!(name: 'Lit Motors', address: '4200 high st', open_weekends: true, years_open: 42)
dealer2 = Dealership.create!(name: 'Elways Dealership', address: '1234 fake st', open_weekends: true, years_open: 12)
dealer3 = Dealership.create!(name: 'Sweet Rides', address: '6943 date st', open_weekends: false, years_open: 69)
dealer4 = Dealership.create!(name: 'Sick Cruises', address: '2020 corona blvd', open_weekends: false, years_open: 20)
dealer5 = Dealership.create!(name: 'White House Dealers', address: '1600 pennsylvania ave', open_weekends: true, years_open: 16)
dealer6 = Dealership.create!(name: 'Could be motors', address: '5050 chance cr', open_weekends: false, years_open: 50)

dealer1.cars.create!(model: 'WRX', make: 'Subaru', year: 2013, under_100k_miles: true)
dealer1.cars.create!(model: 'Outback', make: 'Subaru', year: 1998, under_100k_miles: false)
dealer1.cars.create!(model: 'Forester', make: 'Subaru', year: 2002, under_100k_miles: false)
dealer1.cars.create!(model: 'impreza', make: 'Subaru', year: 2012, under_100k_miles: true)

dealer2.cars.create!(model: 'MDX', make: 'Acura', year: 2006, under_100k_miles: false)
dealer2.cars.create!(model: 'MLR', make: 'Acura', year: 1989, under_100k_miles: true)
dealer2.cars.create!(model: 'TLX', make: 'Acura', year: 2009, under_100k_miles: true)
dealer2.cars.create!(model: 'RLX', make: 'Acura', year: 2001, under_100k_miles: true)

dealer3.cars.create!(model: 'x1', make: 'BMW', year: 2017, under_100k_miles: true)
dealer3.cars.create!(model: 'm3', make: 'BMW', year: 1987, under_100k_miles: false)
dealer3.cars.create!(model: 'Z4', make: 'BMW', year: 2013, under_100k_miles: true)

dealer4.cars.create!(model: 'a7', make: 'Audi', year: 2009, under_100k_miles: true)
dealer4.cars.create!(model: 'a3', make: 'Audi', year: 1999, under_100k_miles: false)

dealer5.cars.create!(model: 'Konna', make: 'Hyundai', year: 2000, under_100k_miles: false)
dealer5.cars.create!(model: 'Accent', make: 'Hyundai', year: 2015, under_100k_miles: true)
dealer5.cars.create!(model: 'Sante Fe', make: 'Hyundai', year: 2006, under_100k_miles: true)


dealer6.cars.create!(model: 'model s', make: 'Tesla', year: 2012, under_100k_miles: true)
dealer6.cars.create!(model: 'cybertruck', make: 'Tesla', year: 2022, under_100k_miles: true)



