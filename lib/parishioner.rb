class Parishioner < ActiveRecord::Base
  
  after_save :capitalize_name
  
  belongs_to :church
  
  validates :name, presence: true
  validates :church_id, presence: true
  
  def self.active
    where(active: true)
  end
  
private
  
  def capitalize_name
    self.name = self.name[0].upcase + self.name[1..-1]
  end
end