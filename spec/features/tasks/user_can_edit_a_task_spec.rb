require 'rails_helper'

RSpec.describe 'When I click on the edit link in the task show page' do
  describe 'I get taken to a form where I can edit the details of the task' do
    it 'and after I press submit, the task is edited and I go to the tasks index page' do

      5.times do |n|
        Task.create!(name: "Task #{n+1}", description: "Description #{n+1}")
      end

      visit '/tasks/2'

      expect(page).to have_link('Edit')
      click_link 'Edit'

      expect(current_path).to eq('/tasks/2/edit')

      fill_in 'task[name]', with: 'Task 2 is Amended'
      fill_in 'task[description]', with: 'Description 2 is Amended'

      click_button 'Submit'
      expect(current_path).to eq('/tasks')
      within('.task_2') do
        expect(page).to have_content('Task 2 is Amended')
        expect(page).to have_content('Description 2 is Amended')
        expect(page).to_not have_content('Task 1')
        expect(page).to_not have_content('Description 1')
      end
    end
  end
end
