class Church < ActiveRecord::Base
  has_many :parishioners
  
  validates :name, presence: true
  
  def parish_members
    members = []
    self.parishioners.each do |parishioner|
      members << "Name: #{parishioner.name}"
    end
    members
  end
end