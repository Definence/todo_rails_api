require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#create' do

    # let(:user_params) { { confirmed: true, email: 'person@example.com', password: '123qwe', password_confirmation: '123qwe', username: 'username', firstname: 'First', lastname: 'Last', token: SecureRandom.hex(15) } }

    # let!(:user) {
     #  User.create(user_params)
    # }

    # it { user.save }
    # it { user.update_column(:confirmed, true) }
    # before {
   #    User.delete_all
   #    User.destroy_all
      # q = User.create( confirmed: true, email: 'person@example.com', password: '123qwe', password_confirmation: '123qwe', username: 'username', firstname: 'First', lastname: 'Last', token: SecureRandom.hex(15))
      # p.save
    # }


    # let(:session_params) {
    #   {
    #     email: '123qwe',
    #      password: '123qwe'
    #   }
    # }

    # it { p '************' }
    # it { p '************' }
    # it { p '123123123123' }
    # it { q }
    # it { p user.update_column(:confirmed, true) }
    # it { p user.errors }
    # it { p user_params }
    # it { p '123123123123' }

    # it 'returns a successful response' do
    #   post :create, params: { session: { email: '123qwe', password: '123qwe' } }
    #   expect(response.status).to eq(200)
    # end

  end
end