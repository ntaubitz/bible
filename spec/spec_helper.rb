# frozen_string_literal: true

require 'rspec'
require 'factory_bot'
require 'faker'
require 'database_cleaner/active_record'

%w[/app/models/*.rb /app/lib/*.rb /spec/factories/*.rb].each do |path|
  Dir[path].sort.each { |file| require file }
end

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: ENV.fetch('DB_NAME', nil),
  username: ENV.fetch('DB_USERNAME', nil),
  password: ENV.fetch('DB_PASSWORD', nil),
  host: ENV.fetch('DB_URL', nil)
)

RSpec.configure do |config|
  # Allows us to simple call create/build/create_stubbed/build_stubbed without needing to refer to FactoryBot in tests
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation, { except: %w[databasechangelog databasechangeloglock] })
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
