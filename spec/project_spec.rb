require('spec_helper')
require('project')


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
    project.save()
    expect(project.id).to(be_an_instance_of(Integer))
  end


describe '#==' do 
  it 'is the same project if title is same' do
    project1 = Project.new({:title => 'humpty dumpty', :id => nil})
    project2 = Project.new({:title => 'humpty dumpty', :id => nil})
    expect(project1 == project2).to(eq(true))
  end
end 


context '.all' do
  it 'is empty' do
    expect(Project.all).to(eq([]))
  end
end

  it 'returns all projects' do
    project1 = Project.new({:title => 'humpty dumpty', :id => nil})
    project1.save()
    project2 = Project.new({:title => 'BIG FOOT', :id => nil})
    project2.save()
    expect(Project.all).to(eq([project1,project2]))
  end


describe '#save' do
  it 'saves a project to the database' do
    project = Project.new({:title => 'humpty dumpty', :id => nil})
    project.save()
    expect(Project.all).to(eq([project]))
  end
end

describe '.find' do
  it 'return project by id' do
    project1 = Project.new({:title => 'humpty dumpty', :id => nil})
    project1.save()
    project2 = Project.new({:title => 'BIG FOOT', :id => nil})
    project2.save()
    expect(Project.find(project1.id)).to(eq(project1))
  end
end

describe '#volunteer' do
  it 'returns all volunteers for a project' do
    project = Project.new({:title => 'humpty dumpty', :id => nil})
    project.save()
    volunteer1 = Volunteer.new({:volunteer => 'Ant', :project_id => project.id, :id => nil})
    volunteer1.save()
    volunteer2 = Volunteer.new({:volunteer => 'Mike', :project_id => project.id, :id => nil})
    volunteer2.save()
    expect(project.volunteers).to(eq([volunteer1, volunteer2]))
    end
  end

describe '#update' do 
  it 'allows user to update' do 
    project = Project.new({:title => 'humpty dumpty', :id => nil})
    project.save()
    project.update({:title => 'humpty lumpty', :id => nil})
    expect(project.title).to(eq('humpty lumpty'))
  end
end

describe '#delete' do 
  it 'allows user to delete' do 
    project = Project.new({:title => 'humpty dumpty', :id => nil})
    project.save()
    project.delete()
    expect(Project.all).to(eq([]))
  end
end

describe '.clear' do 
  it 'clear all projects' do 
    project = Project.new({:title => 'humpty dumpty', :id => nil})
    project.save()
    project2 = Project.new({:title => 'BIG FOOT', :id => nil})
    project2.save()
    Project.clear()
    expect(Project.all).to(eq([]))
  end
end

describe '.search' do
  it 'search for project by title' do 
    project = Project.new({:title => 'humpty dumpty', :id => nil})
    project.save()
    project2 = Project.new({:title => 'BIG FOOT', :id => nil})
    project2.save()
    project3 = Project.new({:title => 'TOY STORY', :id => nil})
    expect(Project.search('humpty dumpty')).to(eq([project]))
  end
end

end





