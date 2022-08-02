require 'rails_helper'

RSpec.describe 'List all tasks in tasks index' do
  describe 'When I visit the tasks index' do
    it 'should list all the tasks created so far with their name and description' do
      10.times do |n|
        Task.create!(name: "Task #{n}", description: "Description #{n}")
      end

      visit '/tasks'

      expect(page).to have_content('Task 1')
      expect(page).to have_content('Description 1')
      expect(page).to have_content('Task 5')
      expect(page).to have_content('Description 5')
      expect(page).to_not have_content('Task 11')
      expect(page).to_not have_content('Description 11')
    end
  end
end