class Application < ActiveRecord::Base
    validates_presence_of :company, :position, :date, :status
    belongs_to :user
end