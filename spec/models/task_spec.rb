require 'rails_helper'

RSpec.describe Task, Type: :model do
  describe 'validations' do
    task = Task.create!(name: 'Task', description: 'Task 1')
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end
