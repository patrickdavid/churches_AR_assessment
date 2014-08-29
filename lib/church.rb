class Church < ActiveRecord::Base
  has_many :parishioners
  
  validates :name, presence: true
end