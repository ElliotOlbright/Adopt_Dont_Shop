class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :application_status :default => 'Pending'

      t.timestamps
    end
  end
end
