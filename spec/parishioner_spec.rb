require 'spec_helper'

describe Parishioner do
  it "belongs to a Church" do
    new_church = Church.create({:name => "SJB"})
    new_member = Parishioner.create({:name => "Bob", :church_id => new_church.id})
    new_member1 = Parishioner.create({:name => "Scott", :church_id => new_church.id})
    expect(new_member1.church).to eq  new_church
  end
  it 'capitalizes the name' do
    member = Parishioner.create(:name => "joe", :church_id =>1)
    expect(member.name).to eq "Joe"
  end
  
  it "validates the presence of name" do
    new_member = Parishioner.create({:name => ''})
    expect(new_member.save).to eq false
  end
  
  it "validates the presence of a church id" do
    new_member = Parishioner.create({:name => 'Joe', :church_id =>''})
    expect(new_member.save).to eq false
  end
  
  it "lists active parishioners of a particular church" do
    church1 = Church.create({:name => 'St. John the Apostle'})
    member = Parishioner.create(:name => "Fr. Mark", :church_id =>church1.id, :active => true)
    member1 = Parishioner.create(:name => "Pat", :church_id =>church1.id, :active => true)
    expect(church1.parishioners.active).to eq [member, member1]
  end
end