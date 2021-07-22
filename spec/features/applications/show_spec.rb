require 'rails_helper'

describe 'Admin Application Show Page' do 
  before :each do
    @app1 = Application.create!(name: 'Caroline Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'pending', description: "I'm a good person") 
    @shelter_1 = Shelter.create!(name: "Denver Humane Society", city: "Denver", rank: 1, foster_program: "true")
    @pet1 = @shelter_1.pets.create!(name: "Rex", breed: "Australian Shepherd", adoptable: true, age: 2)
    @pet2 = @shelter_1.pets.create!(name: "Lady", breed: "Shepherd Mix", adoptable: true, age: 1, image: "dog2.png")
    @p_a1 = @app1.pet_applications.create!(pet_id: @pet2.id, application_id: @app1.id, status: 'Pending')
    

    visit "/admin/applications/#{@app1.id}"
  end

  it 'is on the page' do 
    expect(current_path).to eq("/admin/applications/#{@app1.id}")
  end 

  it 'can display all applicants info' do 
    expect(page).to have_content(@app1.street)
    expect(page).to have_content(@app1.city)
    expect(page).to have_content(@app1.state)
    expect(page).to have_content(@app1.zip_code)
    expect(page).to have_content(@app1.application_status)
    expect(page).to have_content(@pet2.name)
    expect(page).to have_content(@p_a1.status)
  end 

  it 'can approve pets' do 
    expect(@p_a1.status).to eq('Pending')

    click_button 'Approve'
    expect(current_path).to eq("/admin/applications/#{@app1.id}")
  end 

  it 'can reject pets' do 
    expect(@p_a1.status).to eq('Pending')

    click_button 'Reject'
    expect(current_path).to eq("/admin/applications/#{@app1.id}")
  end 
end 