class CreatePetApplication < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_applications do |t|
      t.string :status, :default => 'Pending'

      t.timestamps
    end
  end
end
