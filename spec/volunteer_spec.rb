require('spec_helper')

describe Volunteer do

  before(:each) do
    @project = Project.new(:title => 'humpty dumpty', :id => nil)
    @project.save()
  end

  describe '#name' do
    it 'returns volunteers name' do
      volunteer = Volunteer.new({:name => 'Ant', :project_id => 1, :id => nil})
      expect(volunteer.name).to(eq('Ant'))
    end
  end

  describe '#project_id' do
  it 'returns volunteer project_id' do
    volunteer = Volunteer.new({:name => 'Ant', :project_id => 1, :id => nil})
    expect(volunteer.project_id).to(eq(1))
  end
end  

end
