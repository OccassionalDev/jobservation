class Interview < ActiveRecord::Base
    validates_presence_of :company, :position, :date, :time, :location
    belongs_to :user
end 