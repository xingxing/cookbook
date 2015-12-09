require 'mongoid-rspec'
require "factory_girl"
require "rack/test"

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.mock_with :rspec

  config.include Rack::Test::Methods
  config.include FactoryGirl::Syntax::Methods
  config.include Mongoid::Matchers, type: :model

  config.before(:each) do
    #clear_db 
    Mongoid.purge!
  end

  config.raise_errors_for_deprecations!
end

root_dir = File.expand_path('../..', __FILE__)

require File.join( root_dir , "lib/api.rb")
