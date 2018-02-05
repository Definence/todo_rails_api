require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

	describe '#create' do

		p '************'
		p '************'
		p '************'

		let(:user_params) {
      { user: { email: 'person@example.com', password: '123qwe', password_confirmation: '123qwe', username: 'username', firstname: 'First', lastname: 'Last' } }
    }

		# let(:session_params) {
		# 	{ session: { email: 'person@example.com', password: '123qwe' }
		# }

		# let user = User.new(user_params)

		# it 'returns a successful response' do
		# 	post :create, params: { session_params }
		# 	expect(response).to be_success
		# end

  #   it 'return errors' do
  #     post :create, params: invalid_user_params
  #     expect(response.status).to eq(207)
  #   end

		p '************'
		p '************'
		p '************'

  end

end
