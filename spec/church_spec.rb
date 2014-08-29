require 'spec_helper'

describe Church do
  it "has many parishioners" do
    new_church = Church.create({:name => "SJB"})
    new_member = Parishioner.create({:name => "Bob", :church_id => new_church.id})
    new_member1 = Parishioner.create({:name => "Scott", :church_id => new_church.id})
    new_church.parishioners.should eq [new_member, new_member1]
  end
end