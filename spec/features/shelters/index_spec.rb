require 'rails_helper'

describe 'Pets page' do 
  before :each do
    @shelter_1 = Shelter.create!(name: "Denver Humane Society",
                                city: "Denver",
                                rank: 1,
                                foster_program: "true")

    @shelter_2 = Shelter.create!(name: "Boulder Humane Society",
                                city: "Boulder",                        
                                rank: 2,
                                foster_program: "false")
    @shelter_3 = Shelter.create!(name: "Christies Humane Society",
                                  city: "Chambers",                        
                                  rank: 2,
                                  foster_program: "false")
    @pet1 = @shelter_1.pets.create!(name: "Rex",
                                  breed: "Australian Shepherd",
                                  adoptable: true,
                                  age: 2)
   
    @pet2 = @shelter_1.pets.create!(name: "Lady",
                                  breed: "Shepherd Mix",
                                  adoptable: true,
                                  age: 1)

    @pet3 = @shelter_2.pets.create!(name: "Osco",
                                  breed: "Springer-Spaniel",
                                  adoptable: true,
                                  age: 4)

    @pet4 = @shelter_2.pets.create!(name: "Jack",
                                  breed: "Pitbull",
                                  adoptable: true,
                                  age: 7)
    visit '/admin/shelters'

  end

  it 'can take user to pets page' do 

    expect(current_path).to eq('/admin/shelters')
  end 

  it 'can display all shelters in database' do 
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
  end 

  it 'can take admin to shelters show page' do 
    click_link("#{@shelter_1.name}")

    expect(current_path).to eq("/admin/shelters/#{@shelter_1.id}")
    expect(page).to have_content("#{@shelter_1.name}")
  end 

  it ' can display shelters in alphabetical order backwards' do 
    expect(@shelter_1.name).to appear_before(@shelter_3.name)
    expect(@shelter_3.name).to appear_before(@shelter_2.name)
  end 

  # it 'shows shelters with pending applications' do 
  #   @app1 = Application.create!(name: 'Caroline Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'pending', description: "I'm a good person")
  #   @app2 = Application.create!(name: 'etne Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'pending', description: "I'm a good person")
  #   @pet2 = @shelter_2.pets.create!(name: "Lady", breed: "Shepherd Mix", adoptable: true, age: 1, image: "dog2.png")
  #   @pet1 = @shelter_1.pets.create!(name: "Lady", breed: "Shepherd Mix", adoptable: true, age: 1, image: "dog2.png")
  #   @p_a2 = @app1.pet_applications.create!(pet_id: @pet2.id, application_id: @app1.id, status: 'Approved')
  #   @p_a1 = @app1.pet_applications.create!(pet_id: @pet1.id, application_id: @app1.id, status: 'Approved')

  #   within("#pending")
  #   require "pry"; binding.pry
  #   expect(all("#city")[0].text).to eq(@shelter_1.name)
  #   expect(all("#city")[1].text).to eq(@shelter_2.name)
  # end
end 