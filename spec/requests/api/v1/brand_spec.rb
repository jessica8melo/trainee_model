require 'rails_helper'

RSpec.describe "Api::V1::Brands", type: :request do
  describe "GET /index" do
    before do
      create(:brand, id:1, name: "Adidas")
      create(:brand, id:2, name: "Gucci")
    end
    context " when index return" do
      before do
        get "/api/v1/brand/index"
      end
      it " return http status ok" do 
        expect(response).to have_http_status(:ok)
      end
      it " return a json" do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
      it " return the created instances" do
        expect(JSON.parse(response.body)).to eq([{
          'id' => 1,
          'name' => 'Adidas'
        },
        {
          'id' => 2,
          'name' => 'Gucci'
        }
        ])
      end
    end
  end

  describe "GET /show/:id" do
    let(:brand) {create(:brand)}
    context " id exist" do
      before do
        get "/api/v1/brand/show/#{brand.id}"
      end
      it " return http status ok" do
        expect(response).to have_http_status(:ok)
      end
    end
    context " id not found" do
      before do
        get "/api/v1/brand/show/-1"
      end
      it " return http status not_found" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST /create" do
    let(:user) {create(:user, is_admin: true)}
    let(:brand_params) do
      attributes_for(:brand)
    end
    context " params are ok" do
      it " return http status created" do
        post "/api/v1/brand/create", params: {brand: brand_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    context " with bad params" do
      it " when params are nil" do
        brand_params = nil
        post "/api/v1/brand/create", params: {brand: brand_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
      it " when params are not unique" do
        post "/api/v1/brand/create", params: {brand: brand_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        post "/api/v1/brand/create", params: {brand: brand_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "PATCH /update/:id" do
    let(:user) {create(:user, is_admin: true)}
    let(:brand1) {create(:brand, name: 'Brand1')}
    let(:brand2) {create(:brand, name: 'Brand2')}
    let(:brand_params) do
      attributes_for(:brand)
    end
    context " params are ok" do
      it " return http status ok" do
        patch "/api/v1/brand/update/#{brand1.id}", params: {brand: {name: "Ambev"}}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context " params are nil" do
      it " return http status bad_request" do
        patch "/api/v1/brand/update/#{brand1.id}", params: {brand: {name: nil}}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
    context " params are not unique" do
      it " return http status bad_request" do
        patch "/api/v1/brand/update/#{brand1.id}", params: {brand: {name: brand2.name}}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "DELETE /delete/:id" do
    let(:user) {create(:user, is_admin: true)}
    let(:brand) {create(:brand)}
    context "brand exists" do
      it " returns http status ok" do
        delete "/api/v1/brand/delete/#{brand.id}", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context " brand does not exists" do
      it " returns http status bad_request" do
        delete "/api/v1/brand/delete/-1", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end