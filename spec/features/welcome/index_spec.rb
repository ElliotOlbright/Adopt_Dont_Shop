require 'rails_helper'

describe 'Welcome page' do 
  before :each do
    visit '/'
  end

  it 'can take user to pets page' do 
    
    click_link('Pets')
    expect(current_path).to eq('/pets')
  end 

  it 'can take the admin to the shelter page' do 
  
    click_link('Shelters')
    expect(current_path).to eq('/admin/shelters')
  end 

  it 'can take the admin to the applications page' do 
  
    click_link('Applications')
    expect(current_path).to eq('/admin/applications')
  end 
end 