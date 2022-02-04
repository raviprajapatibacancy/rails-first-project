class Patient < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 50 }
    validates :email,  presence: true,uniqueness: true, length: { maximum: 50 }
    has_many :appointments
    has_many :phsicians, through: :appointments
end
