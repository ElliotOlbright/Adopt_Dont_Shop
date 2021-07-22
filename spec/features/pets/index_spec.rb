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
    visit '/pets'

  end

  it 'can take user to pets page' do 

    expect(current_path).to eq('/pets')
  end 

  it 'can display all pets in database' do 
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet2.name)
    expect(page).to have_content(@pet3.name)
    expect(page).to have_content(@pet4.name)
  end 

  it 'can take user to pet show page' do 
    click_link("#{@pet1.name}")

    expect(current_path).to eq("/pets/#{@pet1.id}")
    expect(page).to have_content("#{@pet1.name}")
  end 

  it 'can take the user to start a new application' do 
    save_and_open_page
    click_link('Start an Application')
    expect(current_path).to eq('/apps/new')
  end
  
end 