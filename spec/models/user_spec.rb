require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    # email
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    # password
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_length_of(:password_confirmation).is_at_least(6) }
    it { should have_secure_password }

    # firstname
    it { should validate_length_of(:firstname).is_at_least(3) }
    it { should validate_presence_of(:firstname) }

    # lastname
    it { should validate_presence_of(:lastname) }
    it { should validate_length_of(:lastname).is_at_least(4) }

    # username
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:username) }
  end

  context 'associations' do
    it { should have_many(:tasks) }
  end

  context 'accept nested attributes for' do
    it { accept_nested_attributes_for(:tasks) }
  end
end
