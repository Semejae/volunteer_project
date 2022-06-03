require('rspec')
require('pg')
require('project')
require('pry')

class Volunteer
  attr_reader :id
  attr_accessor :name, :project_id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(name, nil)
    @project_id = attributes.fetch(:project_id)
  end

end