require('pg')
require('rspec')
require('project')
require('volunteer')
require('pry')


DB = PG.connect({:dbname => 'volunteer_project_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM projects *;")
    DB.exec("DELETE FROM volunteers *;")
  end
end