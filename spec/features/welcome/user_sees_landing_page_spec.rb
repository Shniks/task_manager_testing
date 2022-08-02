require 'rails_helper'

RSpec.describe "welcome page", type: :feature do
  describe "When I visit the / page" do
    it "displays a welcome message and has links to the tasks index page and create a task page" do

      visit root_path

      expect(page).to have_content "Welcome to Task Manager"
      expect(page).to have_content "Tasks Index"
      expect(page).to have_content "Create a New Task"
    end
  end
end
