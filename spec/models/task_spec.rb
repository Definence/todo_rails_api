require 'rails_helper'


RSpec.describe Task, type: :model do
  context 'validations' do
    # title
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:title).is_at_most(30) }

    # description
    it { should validate_presence_of(:description) }

    # date
    it { should validate_presence_of(:due_date) }

    # priority
    it { should validate_presence_of(:priority) }
    it { should validate_numericality_of(:priority) }
    it { should allow_values(1, 2, 3).for(:priority) }
  end

  context 'associations' do
    it { should belong_to(:user) }
  end
end
