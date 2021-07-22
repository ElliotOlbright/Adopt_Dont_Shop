require 'rails_helper'

describe 'New Application page' do 
  before :each do
    visit "/apps/new"
  end

  it 'is on the right page' do 
    expect(current_path).to eq('/apps/new')
  end 
  
  it 'create a new app' do 
    expect(page).to have_field(:name)
    expect(page).to have_field(:street)
    expect(page).to have_field(:city)
    expect(page).to have_field(:state)
    expect(page).to have_field(:zip_code)

    fill_in :name, with: 'Johnny'
    fill_in :street, with: 'some street'
    fill_in :city, with: 'some city'
    fill_in :state, with: 'state'
    fill_in :zip_code, with: 'zip_code'

    click_button 'Submit'
    
    expect(current_path).to eq("/apps/#{Application.first.id}") 
  
  end 

  it 'create a new app' do 
    expect(page).to have_field(:name)
    expect(page).to have_field(:street)
    expect(page).to have_field(:city)
    expect(page).to have_field(:state)
    expect(page).to have_field(:zip_code)

    fill_in :name, with: 'Johnny'
    fill_in :street, with: 'some street'
    fill_in :city, with: 'some city'
    fill_in :state, with: 'state'

    click_button 'Submit'
    
    expect(current_path).to eq("/apps/new") 
    expect(page).to have_content("Don't Be Silly! Please Fill Out All Required Fields!")
  end 



end 