require 'rails_helper'

describe 'Pets page' do 
  before :each do
    @app1 = Application.create!(name: 'Caroline Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'pending', description: "I'm a good person")
    @app2 = Application.create!(name: 'Ezze Alwfai', street: '1234 fake st', city: 'Lafayette', state: 'Colorado', zip_code: 80328, application_status: 'pending', description: "I'm a good person")
    @app3 = Application.create!(name: 'Marla Shulz', street: '2020 Corona st', city: 'Denver', state: 'Colorado', zip_code: 80218, application_status: 'approved', description: "I'm a good person")   
    @shelter_1 = Shelter.create!(name: "Denver Humane Society",
                                city: "Denver",
                                rank: 1,
                                foster_program: "true")

    @shelter_2 = Shelter.create!(name: "Boulder Humane Society",
                                city: "Boulder",                        
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
    visit '/admin/applications'

  end

  it 'can take user to applications page' do 

    expect(current_path).to eq('/admin/applications')
  end 

  it 'can display all pets in database' do 
    expect(page).to have_content(@app1.name)
    expect(page).to have_content(@app2.name)
    expect(page).to have_content(@app3.name)
  end 

  it 'can take admin to application show page' do 
    click_link("#{@app1.name}")

    expect(current_path).to eq("/admin/applications/#{@app1.id}")
    expect(page).to have_content("#{@app1.name}")
  end 
end 