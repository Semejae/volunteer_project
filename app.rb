require("pg")
require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('pry')
require('./lib/volunteer')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_project"})

get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/project') do
  @projects = Project.all
  erb(:projects)
end

get('/project/new') do
  erb(:new_project)
end

get('/project/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

post('/projects') do
  title = params[:project_name]
  project = Project.new(:title => title, :id => nil)
  project.save()
  @projects = Project.all()
  erb(:projects)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch('/project/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:title])
  @projects = Project.all
  erb(:projects)
end

delete('/project/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  @projects = Project.all
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