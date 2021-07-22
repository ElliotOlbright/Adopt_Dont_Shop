require "rails_helper"

describe Application, type: :model do
  describe "relationships" do
    it {should have_many(:pets).through(:pet_applications)}
    it {should have_many(:pet_applications)}
  end
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:street)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip_code)}
  end 

  describe 'Model Methods' do 
    it 'can find a pet application' do 
      app1 = Application.create!(name: 'Caroline Tan', street: '2534 Tan Blvd', city: 'Boulder', state: 'Colorado', zip_code: 80204, application_status: 'pending', description: "I'm a good person")
      shelter_2 = Shelter.create!(name: "Boulder Humane Society", city: "Boulder", rank: 2, foster_program: "false")
      pet2 = shelter_2.pets.create!(name: "Lady", breed: "Shepherd Mix", adoptable: true, age: 1, image: "dog2.png")
      p_a1 = app1.pet_applications.create!(pet_id: pet2.id, application_id: app1.id, status: 'Approved')

      expect(app1.find_pet_app(pet2.id).status).to eq('Approved')
    end 
  end 
end