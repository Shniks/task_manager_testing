require 'rails_helper'

RSpec.describe 'Create new task', Type: :feature do
  describe 'When I click on the Create a New Task link' do
    it 'should take me to fill a form' do

      visit '/'
      click_link 'Create a New Task'

      expect(current_path).to eq('/tasks/new')

      fill_in 'task[name]', with: 'Task 1'
      fill_in 'task[description]', with: 'Desc of Task 1'

      click_button 'Submit'

      expect(current_path).to eq('/tasks')

      within('.container') do
        expect(page).to have_content("Task 1")
        expect(page).to have_content("Desc of Task 1")
      end
    end
  end
end
