require('rspec')
require('pg')
require('volunteer')
require('pry')

class Project 
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def ==(project_to_compare)
    self.title() == project_to_compare.title()
  end

  def self.all
    returned_project = DB.exec('SELECT * FROM volunteer_project')
    project = []
    returned_project.each() do |project|
      title = project.fetch('title')
      id = project.fetch('id').to_i
      project.push(Project.new({:title => title, :id => id}))
    end
    project
  end

  def save
    result = DB.exec("INSERT INTO project (name) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  def self.find(id)
    project = DB.exec('SELECT * FROM project WHERE id = #{id};').first
    if project
      title = project.fetch('title')
      id = project.fetch('id').to_i
      Project.new({:title => title, :id => id})
    else
      nil
    end
  end



end