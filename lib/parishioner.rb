class Parishioner < ActiveRecord::Base
  
  after_save :capitalize_name
  
  belongs_to :church
  
private
  
  def capitalize_name
    self.name = self.name[0].upcase + self.name[1..-1]
  end
end