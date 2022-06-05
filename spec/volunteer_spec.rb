require('spec_helper')

describe Volunteer do

  before(:each) do
    @project = Project.new(:title => 'humpty dumpty', :id => nil)
    @project.save()
  end

  describe '#name' do
    it 'returns volunteers name' do
      practice_volunteer = Volunteer.new({:volunteer => 'Ant', :project_id => 1, :id => nil})
      expect(practice_volunteer.volunteer).to(eq('Ant'))
    end
  end

  describe '#project_id' do
    it 'returns volunteer project_id' do
      volunteer = Volunteer.new({:volunteer => 'Ant', :project_id => 1, :id => nil})
      expect(volunteer.project_id).to(eq(1))
  end
end  

describe '#==' do
  it 'check for same name of volunteer' do 
    volunteer1 = Volunteer.new({:volunteer => 'Ant', :project_id => 1, :id => nil})
    volunteer2 = Volunteer.new({:volunteer => 'Ant', :project_id => 1, :id => nil})
    expect(volunteer1 == volunteer2).to(eq(true))
  end
end

end
