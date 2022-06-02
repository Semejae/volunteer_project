require('respec')
require('pg')
require('project')
require('volunteer')
require('pry')

DB = PG.connect({:dbname => 'volunteer_project_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM project *;")
    DB.exec("DELETE FROM volunteer *;")
  end
end