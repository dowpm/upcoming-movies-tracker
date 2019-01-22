class User < ActiveRecord::Base
    has_many :movies
    validates :username, presence: true
    validates :username, uniqueness: true
    has_secure_password
end