require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "user login" do
    before do
      create(:user, email: 'teste@teste', password:'123456')
    end

    context "when user has no valid email" do
      it " return http status unauthorized" do
        get '/api/v1/user/login', params: {
          email: 'teste@test',
          password: '123456'
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when user has no valid password" do
      it " return http status unauthorized" do
        get '/api/v1/user/login', params: {
          email: 'teste@teste',
          password: '12345689'
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "user logout" do
    let(:user) {create(:user)}
    before do
      get '/api/v1/user/login', params: {
        email: 'trainee@struct',
        password: '123456'
      }
    end

    context "when user is loged" do
      it "return http status ok" do
        get '/api/v1/user/logout', headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
