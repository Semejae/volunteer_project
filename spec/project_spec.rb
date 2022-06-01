require('project')

describe Project do

  describe '#title' do
  it 'returns the title for project' do
    project = Project.new({:title => 'humpty dumpty',:id => nil})
    expect(project.title).to(eq('humpty dumpty'))
  end
end

end