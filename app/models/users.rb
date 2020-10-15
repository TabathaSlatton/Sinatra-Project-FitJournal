class User < ActiveRecord::Base
    has_many :posts
    has_many :goals
    has_secure_password

    validates :email_address, :first_name, :last_name, :username, presence: :true
    validates :email_address, uniqueness: :true
end