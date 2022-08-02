require 'rails_helper'

RSpec.describe 'When I click on the edit link in the task show page' do
  describe 'I get taken to a form where I can edit the details of the task' do
    it 'and after I press submit, the task is edited and I go to the tasks index page' do

      5.times do |n|
        Task.create!(name: "Task #{n}", description: "Description #{n}")
      end

      visit '/tasks/2'

      expect(page).to have_link('Edit')
      click_link 'Edit'

      expect(current_path).to eq('/tasks/2/edit')

      fill_in 'task[name]', with: 'Amended Task'
      fill_in 'task[description]', with: 'Amended Description'

      click_button 'Submit'

      expect(current_path).to eq('/tasks')

      within(.'task_3') do
        expect(page).to have_content('Amended Task')
        expect(page).to have_content('Amended Description')
        expect(page).to_not have_content('Task 2')
        expect(page).to_not have_content('Description 2')
      end
    end
  end
end
