require 'rails_helper'

RSpec.describe "Api::V1::Admins", type: :request do
  describe "admin login" do
    before do
      create(:admin, email: 'teste@teste', password:'123456')
    end

    context "when admin has no valid email" do
      it " return http status unauthorized" do
        get '/api/v1/admin/login', params: {
          email: 'teste@test',
          password: '123456'
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when admin has no valid pasword" do
      it " return http status unauthorized" do
        get '/api/v1/admin/login', params: {
          email: 'teste@teste',
          password: '12345689'
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "admin logout" do
    let(:admin) {create(:admin)}
    before do
      get '/api/v1/admin/login', params: {
        email: 'trainee@struct',
        password: '123456'
      }
    end

    context "when admin is loged" do
      it "return http status ok" do
        get '/api/v1/admin/logout', headers: {
          'X-Admin-Email': admin.email,
          'X-Admin-Token': admin.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
