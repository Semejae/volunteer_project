require("pg")
require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('pry')
require('./lib/volunteer')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_project"})

get('/') do
  @project = Project.all
  erb(:projects)
end

get('/project') do
  @project = Project.all
  erb(:projects)
end

get('/project/new') do
  erb(:new_project)
end

get('/project/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

post('/project') do
  name = params[:project_name]
  name = Project.new(name, nil)
  name.save()
  @project = Project.all()
  erb(:projects)
end

get('/project/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch('/project/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:name])
  @project = Project.all
  erb(:projects)
end

delete('/project/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  @project = project.all
  erb(:projects)
end

get('/project/:id/volunteer/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  erb(:volunteer)
end

post('/project/:id/volunteer') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.new(params[:volunteer_name], @project.id, nil)
  volunteer.save()
  erb(:project)
end


patch('/project/:id/volunteer/:volunteer_id') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.find(params[:volunteer_id].to_i())
  volunteer.update(params[:name], @project.id)
  erb(:project)
end


delete('/project/:id/volunteer/:volunteer_id') do

  volunteer = Volunteer.find(params[:volunteer_id].to_i())
  volunteer.delete
  @project = Project.find(params[:id].to_i())
  erb(:project)
end