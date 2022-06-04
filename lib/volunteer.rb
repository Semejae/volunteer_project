require('rspec')
require('pg')
require('volunteer')
require('pry')

class Volunteer
  attr_reader :id
  attr_accessor :name, :project_id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(name, nil)
    @project_id = attributes.fetch(:project_id)
  end

  def ==(volunteer_to_compare)
    if volunteer_to_compare != nil
    (self.name() == volunteer_to_compare.name()) && (self.project_id() == volunteer_to_compare.project_id())
    else
      false
    end
  end

  def self.all
    returned_volunteer = DB.exec('SELECT * FROM volunteer;')
    volunteer = []
    returned_volunteer.each() do |volunteer|
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id').to_i
      id = volunteer.fetch('id').to_i
      volunteer.push(volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteer
  end

  def save
    result = DB.exec("INSERT INTO volunteer (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  def self.find(id)
    volunteer = DB.exec('SELECT * FROM volunteer WHERE id = #{id};').first
    if volunteer
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id').to_i
      id = volunteer.fetch('id').to_i
      volunteer.new({:name => name, :project_id => project_id, :id => id})
    else
      nil
    end
  end

  def self.find_by_project(pjct_id)
    volunteer = []
    returned_volunteer = DB.exec("SELECT * FROM volunteer WHERE project_id = #{pjct_id};")
    returned_volunteer.each() do |volunteer|
      name = volunteer.fetch('name')
      id = volunteer.fetch('id').to_i
      volunteer.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
  end
  volunteer
end

  def update(name, project_id)
    @name = name
    @project_id = project_id
      DB.exec("UPDATE volunteers SET name = '#{@name}', project_id = #{@project_id} WHERE id = #{@id};")
    end

  def delete
    DB.exec("DELETE FROM volunteer WHERE id = #{@id};")
  end

  def self.clear
    DB.exec('DELETE FROM volunteer *;')
  end
