class User < ActiveRecord::Base
    has_secure_password
    has_many :interviews
    has_many :applications
end 