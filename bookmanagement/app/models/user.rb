class User < ApplicationRecord
    has_secure_password
    validates :name, :password, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
end