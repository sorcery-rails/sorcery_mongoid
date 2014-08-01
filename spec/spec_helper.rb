$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'database_cleaner'
require 'sorcery'
require 'mongoid'

Sorcery::Controller::Config.submodules = [:external, :activity_logging]

require 'sorcery_mongoid'


DatabaseCleaner.strategy = :truncation

Mongoid.configure do |config|
  database = "sorcery_mongoid_test"
  if config.respond_to?(:connect_to)
    config.connect_to(database)
  else
    config.master = Mongo::Connection.new.db(database)
  end

  config.use_utc = true
  config.include_root_in_json = true
end

RSpec.configure do |config|
  config.mock_with :rspec
end
