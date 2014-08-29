require 'bundler/setup'
Bundler.require(:default, :test)
require "shoulda/matchers"
require "church"
require "parishioner"


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Church.all.each { |churches| churches.destroy }
    Parishioner.all.each { |parishioners| parishioners.destroy }
  end
end