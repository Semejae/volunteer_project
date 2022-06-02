require('respec')
require('pg')
require('project')
require('volunteer')
require('pry')

describe Project do

  describe '#title' do
  it 'returns the title for project' do
    project = Project.new({:title => 'humpty dumpty',:id => nil})
    expect(project.title).to(eq('humpty dumpty'))
  end
end

  context '#id' do
  it 'returns id before saving' do
    project = Project.new({:title => 'humpty dumpty',:id => nil})
    expect(project.id).to(eq(nil))
  end
end
  it 'returns id after saving' do
    project = Project.new({:title => 'humpty dumpty',:id => nil})
    project.save
    expect(project.id).to(be_an_instance_of(Integer))
  end
end

