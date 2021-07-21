class Application < ApplicationRecord 
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
 

  has_many :pet_applications, dependent: :destroy  
  has_many :pets, through: :pet_applications

  def find_pet_app(pet_id)
    pet_applications.find_by(pet_id: pet_id)
  end 
end 