require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe '#create' do

    let(:valid_user_params) {
      { user: { email: 'person@example.com', password: '123qwe', password_confirmation: '123qwe', username: 'username', firstname: 'First', lastname: 'Last' } }
    }

     let(:invalid_user_params) {
      { user: { email: '', password: '', password_confirmation: '', username: '', firstname: '', lastname: ''} }
    }

    it 'returns a successful response' do
      post :create, params: valid_user_params
      expect(response).to be_success
    end

    it 'return errors' do
      post :create, params: invalid_user_params
      expect(response.status).to eq(207)
    end

  end

  describe '#email confirmation' do

    let(:valid_user_params) { { email: 'person@example.com', password: '123qwe', password_confirmation: '123qwe', username: 'username', firstname: 'First', lastname: 'Last', token: SecureRandom.hex(15) } }
    let(:user) { User.create(valid_user_params) }

    it 'returns a successful response' do
      post :email_confirmation, params: { user: user.token }
      expect(response).to be_success
    end

  end

end
