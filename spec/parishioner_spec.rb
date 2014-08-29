require 'spec_helper'

describe Parishioner do
  it "belongs to a Church" do
    new_church = Church.create({:name => "SJB"})
    new_member = Parishioner.create({:name => "Bob", :church_id => new_church.id})
    new_member1 = Parishioner.create({:name => "Scott", :church_id => new_church.id})
    new_member1.church.should eq new_church
  end
end