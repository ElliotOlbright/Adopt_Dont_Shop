# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Application.destroy_all
PetApplication.destroy_all
Pet.destroy_all
Shelter.destroy_all

#applications
app1 = Application.create!(name: 'Caroline Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'pending', description: "I'm a good person")
app2 = Application.create!(name: 'Ezze Alwfai', street: '1234 fake st', city: 'Lafayette', state: 'Colorado', zip_code: 80328, application_status: 'pending', description: "I'm a good person")
app3 = Application.create!(name: 'Marla Shulz', street: '2020 Corona st', city: 'Denver', state: 'Colorado', zip_code: 80218, application_status: 'approved', description: "I'm a good person")
app4 = Application.create!(name: 'Matt Kragen', street: '5522 California st', city: 'Denver', state: 'Colorado', zip_code: 80218, application_status: 'approved', description: "I'm a good person")
app5 = Application.create!(name: 'Scott Berecki', street: '2222 Studio rd', city: 'Colorado Springs', state: 'Colorado', zip_code: 80907, application_status: 'rejected', description: "I'm a good person")
app6 = Application.create!(name: 'Sami Peterson', street: '9341 Chicago st', city: 'Westminster', state: 'Colorado', zip_code: 80305, application_status: 'rejected', description: "I'm a good person")
app7 = Application.create!(name: 'Taylor Varoglu', street: '1529 Beard st', city: 'Boulder', state: 'Colorado', zip_code: 80304, application_status: 'approve', description: "I'm a good person")
app8 = Application.create!(name: 'Micheal Abbott', street: '6733 Washington st', city: 'Lyons', state: 'Colorado', zip_code: 80540, application_status: 'pending', description: "I'm a good person")
app9 = Application.create!(name: 'Ozzie Osmonson', street: '2342 Pesto ln', city: 'Denver', state: 'Colorado', zip_code: 80019, application_status: 'rejected', description: "I'm a good person")
app10 = Application.create!(name: 'Carina Sweets', street: '6354 Candy ln', city: 'Longmont', state: 'Colorado', zip_code: 80504, application_status: 'pending', description: "I'm a good person")



#shelters
shelter_1 = Shelter.create!(name: "Denver Humane Society",
                            city: "Denver",
                            rank: 1,
                            foster_program: "true")


shelter_2 = Shelter.create!(name: "Boulder Humane Society",
                            city: "Boulder",                        
                            rank: 2,
                            foster_program: "false")

shelter_3 = Shelter.create!(name: 'Aurora shelter', 
                            city: 'Aurora, CO', 
                            foster_program: false, 
                            rank: 9)

shelter_4 = Shelter.create!(name: 'Littleton shelter', 
                            city: 'Littleton, CO', 
                            foster_program: true, 
                            rank: 7)

shelter_5 = Shelter.create!(name: 'Denver shelter', 
                            city: 'Denver, CO', 
                            foster_program: true, 
                            rank: 10)

shelter_6 = Shelter.create!(name: 'Centennial shelter', 
                            city: 'Cenntenial, CO', 
                            foster_program: false, 
                            rank: 4)

shelter_7 = Shelter.create!(name: 'Englewood shelter', 
                            city: 'Englewood, CO', 
                            foster_program: true, 
                            rank: 2)

                            
#pets
pet1 = shelter_2.pets.create!(name: "Rex",
                              breed: "Australian Shepherd",
                              adoptable: true,
                              age: 2,
                              image: "dog1.png")

                           
pet2 = shelter_2.pets.create!(name: "Lady",
                              breed: "Shepherd Mix",
                              adoptable: true,
                              age: 1,
                              image: "dog2.png",
                            )

pet3 = shelter_3.pets.create!(name: "Osco",
                              breed: "Springer-Spaniel",
                              adoptable: true,
                              age: 4,
                              image: "dog3.png")

pet4 = shelter_3.pets.create!(name: "Jack",
                              breed: "Pitbull",
                              adoptable: true,
                              age: 7,
                              image: "dog4.png")

pet5 = shelter_4.pets.create!(name: "Jibbs",
                              breed: "Pug",
                              adoptable: true,
                              age: 5,
                              image: "dog5.png")

pet6 = shelter_4.pets.create!(name: "Jax",
                              breed: "Lab Mix",
                              adoptable: true,
                              age: 4,
                              image: "dog6.png"
                            )

pet7 = shelter_1.pets.create!(name: "Bianca",
                              breed: "Golden Retriever",
                              adoptable: true,
                              age: 2,
                              image: "dog7.png")

pet8 = shelter_1.pets.create!(name: "Beans",
                              breed: "German Shepherd",
                              adoptable: true,
                              age: 9,
                              image: "dog8.png")

pet9 = shelter_1.pets.create!(name: "Stella",
                              breed: "Chihuahua",
                              adoptable: true,
                              age: 12,
                              image: "dog9.png")

p_a1 = app1.pet_applications.create!(pet_id: pet2.id, application_id: app1.id)





