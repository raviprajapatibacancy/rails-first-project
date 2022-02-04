class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :phsician
      t.belongs_to :patient
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
