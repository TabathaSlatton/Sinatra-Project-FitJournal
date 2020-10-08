class User < ActiveRecord::Base
    has_many :posts
    has_many :goals
    has_many :journals
    has_secure_password
end