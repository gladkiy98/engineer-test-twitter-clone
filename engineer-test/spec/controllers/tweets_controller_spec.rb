require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe '#create' do
    let(:user) { User.create(username: 'user', password: '123', password_confirmation: '123')}

    context 'with valid params' do
      before do
        post :create, params: { body: 'Text' }
      end

      it { expect(response).to have_http_status(:found) }
    end
  end
end
