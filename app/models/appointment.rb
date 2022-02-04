class Appointment < ApplicationRecord
    belongs_to :patient, optional: true
    belongs_to :phsician
    validates :appointment_date,  presence: true
end
