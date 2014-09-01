require 'spec_helper'

describe Church do
  it "has many parishioners" do
    new_church = Church.create({:name => "SJB"})
    new_member = Parishioner.create({:name => "Bob", :church_id => new_church.id})
    new_member1 = Parishioner.create({:name => "Scott", :church_id => new_church.id})
    new_church.parishioners.should eq [new_member, new_member1]
  end
  
  it "validates the presence of name" do
    new_church = Church.create({:name => ''})
    expect(new_church.save).to eq false
  end
  
  it "lists parishioners of a particular church" do
    church1 = Church.create({:name => 'St. John the Apostle'})
    church2 = Church.create({:name => 'St. John the Baptist'})
    member = Parishioner.create(:name => "Fr. Mark", :church_id =>church1.id)
    member1 = Parishioner.create(:name => "Pat", :church_id =>church1.id)
    member2 = Parishioner.create(:name => "Fr. Dan", :church_id =>church2.id)
    expect(church1.parish_members).to eq ["Name: Fr. Mark", "Name: Pat"]
  end 
end