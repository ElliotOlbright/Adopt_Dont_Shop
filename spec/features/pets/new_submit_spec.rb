require 'rails_helper'

describe 'New Application Submit page' do 
  before :each do
    @app1 = Application.create!(name: 'Caroline Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'In Progress', description: "I'm a good person")
    @shelter_1 = Shelter.create!(name: "Denver Humane Society",
                                city: "Denver",
                                rank: 1,
                                foster_program: "true")
    @pet7 = @shelter_1.pets.create!(name: "Bianca",
                                  breed: "Golden Retriever",
                                  adoptable: true,
                                  age: 2,
                                  image: "dog7.png")
    
    @pet8 = @shelter_1.pets.create!(name: "Beans",
                                  breed: "German Shepherd",
                                  adoptable: true,
                                  age: 9,
                                  image: "dog8.png")
    visit "/apps/#{@app1.id}"
  end

  it 'is on the right page' do 
    expect(current_path).to eq("/apps/#{@app1.id}")
      save_and_open_page
    expect(page).to have_content(@app1.name)
    expect(page).to have_content(@app1.street)
    expect(page).to have_content(@app1.city)

  end 
  
  it 'can a search for pets' do
    fill_in :search_by_name, with: 'c'
    click_button 'Search'

    expect(page).to have_content(@pet7.name) 
  end 

  it 'can add pets to application' do
    expect(page).to have_content('Oops! Looks like You Havent Added Any Pets Yet!')

    fill_in :search_by_name, with: 'c'
    click_button 'Search'

    expect(page).to have_content(@pet7.name)

    click_button 'Adopt This pet' 

    expect(page).to have_content('Pets on this App')
    expect(page).to have_content(@pet7.name)
    expect(page).to have_content('What Makes You A Good Fit')
  end 

  it 'can submit application' do
    fill_in :search_by_name, with: 'c'
    click_button 'Search'
    click_button 'Adopt This pet' 

    fill_in :description, with: "I'm cool"
    click_button 'Submit'
    expect(page).to have_no_content('What Makes You A Good Fit')
    expect(page).to have_content('Application Status: Pending')
  end 
end 