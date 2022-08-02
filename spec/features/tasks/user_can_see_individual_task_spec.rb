require 'rails_helper'

RSpec.describe 'When I click on an individual task on the tasks index page' do
  it 'I get taken to the show page for that task where I see its name and description' do

    5.times do |n|
      Task.create!(name: "Task #{n}", description: "Description #{n}")
    end

    visit root_path
    click_link 'Tasks Index'

    within('.task_2') do
      click_link 'Task 1'
    end

    expect(page).to have_content('Task 1')
    expect(page).to have_content('Description 1')
    expect(page).to have_content('Back to Tasks Index')
  end
end
