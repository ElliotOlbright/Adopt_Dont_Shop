class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  def self.order_rev
    find_by_sql("SELECT * FROM shelters ORDER BY name desc")
  end

  def self.with_pending_applications
    joins(pets: :applications)
      .where('applications.application_status = ?', 'Pending')
      .distinct
  end
end