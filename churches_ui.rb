require 'active_record'
ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["development"])


require './lib/parishioner'
require './lib/church'

loop do
  def menu
    system 'clear'
    puts "Parish Tracker Main Menu"
    puts "Press [1] >> To list all churches"
    puts "Press [2] >> To list all parishioners" 
    puts "Press [3] >> To add a church"
    puts "Press [4] >> To add a parishioner"
    puts "Press [6] >> To remove a parishioner"
    puts "Press [7] >> To remove a church"
    puts "Press [8] >> To list all active members of a particular church"
    puts "Type 'x' to exit"
    choice = gets.chomp.downcase
    case choice
    when '1'
      list_churches
    when '2'
      list_parishioners
    when '3' 
      add_church
    when '4'
      add_parishioner
    when '5'
      inactivate
    when '6'
      remove_parishioner
    when '7'
      remove_church
    when '8'
      church_parishioners
      when 'x'
      puts "Goodbye"
      exit
    else
      puts "Please enter a valid option."
      menu
    end
  end
  
  def list_churches
    Church.all.each do |church|
      puts "ID: #{church.id} Name: #{church.name}"
    end
    puts "Press enter to continue"
    gets
  end
  
  def list_parishioners
    Parishioner.all.each do |parishioner|
      puts "#{parishioner.name}"
    end
    puts "Press enter to continue"
    gets
  end

  def add_church
    puts "Please Enter the new Church's name"
    name = gets.chomp
    new_church = Church.create({:name => name})
    puts 'Enter to continue'
    gets
  end
  
  def add_parishioner
    puts "Enter the parishioner's name"
    name = gets.chomp
    list_churches
    puts "Enter the parishioner's church ID"
    id = gets.chomp.to_i
    new_member = Parishioner.create({:name => name, :church_id => id})
    puts "New member added"
    puts "Press enter to continue"
    gets
  end
  
  def remove_parishioner
    Parishioner.all.each do |parishioner|
      puts "#{parishioner.name}, ID: #{parishioner.id}"
    end
    puts "Please enter the id of the parishioner you would like to remove."
    reply = gets.chomp.to_i
    Parishioner.destroy(reply)
    puts "Member removed"
    puts "Press enter to continue"
    gets
  end

  def remove_church
    Church.all.each do |church|
      puts "ID: #{church.id} Name: #{church.name}"
    end
    puts "please enter the id of the church you would like to remove."
    reply = gets.chomp.to_i
    Church.destroy(reply)
    puts "Church removed"
    puts "Press enter to continue"
    gets
  end
  
  def church_parishioners
    Church.all.each do |church|
      puts "ID: #{church.id} Name: #{church.name}"
    end
    puts "Please enter the church ID to view its active parishioners?"
    church = gets.chomp.to_i
    Church.all.each do |index|
      if church == index.id
        index.parishioners.active.each do |instance|
          puts instance.name
        end
      end
    end
    puts "Press enter to continue"
    gets
  end
  menu
end