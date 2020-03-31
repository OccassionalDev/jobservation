class User < ActiveRecord::Base
    validates_presence_of :name, :email, :password_digest
    validates_uniqueness_of :email

    has_secure_password
    has_many :interviews
    has_many :applications
end 