require 'rails_helper'

describe 'Pets show page' do 
  before :each do
    @shelter_1 = Shelter.create!(name: "Denver Humane Society",
                                city: "Denver",
                                rank: 1,
                                foster_program: "true")
    @pet1 = @shelter_1.pets.create!(name: "Rex",
                                  breed: "Australian Shepherd",
                                  adoptable: true,
                                  age: 2)
    visit "/pets/#{@pet1.id}"
  end

  it 'is on the correct page' do 
    expect(current_path).to eq("/pets/#{@pet1.id}")
  end 
end 