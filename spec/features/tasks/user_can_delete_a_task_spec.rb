require 'rails_helper'

RSpec.describe 'When I click the delete link next to a task' do
  describe 'it deletes the specific task' do
    it 'and that task is not part of the tasks index anymore' do

      5.times do |n|
        Task.create!(name: "Task #{n+1}", description: "Description #{n+1}")
      end

      visit '/tasks'

      within('.task_4') do
        click_button 'Delete'
      end
      expect(page).to_not have_content('Task 4')
      expect(page).to_not have_content('Description 4')
    end
  end
end
