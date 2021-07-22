require "rails_helper"

describe Shelter, type: :model do
  describe "relationships" do
    it {should have_many(:pets)}
  end

  describe 'Model Methods' do 
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

      @app1 = Application.create!(name: 'Caroline Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'pending', description: "I'm a good person")
      @app2 = Application.create!(name: 'etne Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'pending', description: "I'm a good person")
      @pet2 = @shelter_2.pets.create!(name: "Lady", breed: "Shepherd Mix", adoptable: true, age: 1, image: "dog2.png")
      @pet1 = @shelter_1.pets.create!(name: "Lady", breed: "Shepherd Mix", adoptable: true, age: 1, image: "dog2.png")
      @p_a2 = @app1.pet_applications.create!(pet_id: @pet2.id, application_id: @app1.id, status: 'Approved')
      @p_a1 = @app1.pet_applications.create!(pet_id: @pet1.id, application_id: @app1.id, status: 'Approved')
                            
    end 

    it 'can order by reverse alpabetical' do 
      expect(Shelter.order_rev).to eq([@shelter_1, @shelter_3, @shelter_2])
    end 
  end 
end
