class Pet < ApplicationRecord 
  belongs_to :shelter 
  has_many :pet_applications, dependent: :destroy
  has_many :applications, through: :pet_applications

def find_pet_app_status(application_id)
  pet_applications.find_by(application_id: application_id).status
end 
end 