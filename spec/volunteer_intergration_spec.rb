require('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the project creation path', {:type => :feature} do
  it 'takes the user to the homepage where they create a project' do
    visit '/project'
    fill_in('project_name', :with => 'humpty dumpty')
    click_button('Create Project')
    expect(page).to have_content('humpty dumpty')
  end
end