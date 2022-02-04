class User < ApplicationRecord
    has_secure_password
    validates :username,  presence: false, length: { maximum: 50 }
end