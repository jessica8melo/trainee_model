require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
    describe "GET /index" do
        before do 
            create(:category, id:1, name: "Lazer")
            create(:category, id:2, name: "Móveis")
        end
        context " when index return " do 
            before do
                get "/api/v1/category/index"
            end
            it " return http status ok " do
                expect(response).to have_http_status(:ok)
            end
            it " return a json" do
                expect(response.content_type).to eq('application/json; charset=utf-8')
            end
            it "return the created instances " do
                expect(JSON.parse(response.body)).to eq([{
                    'created_at' => eval(Category.find(1).created_at.to_json),
                    'id' => 1,
                    'name' => 'Lazer',
                    'updated_at' => eval(Category.find(1).updated_at.to_json)
                },
                {
                    'created_at' => eval(Category.find(2).created_at.to_json),
                    'id' => 2,
                    'name' => 'Móveis',
                    'updated_at' => eval(Category.find(2).updated_at.to_json)
                }
                ])
            end
        end
    end

    describe "GET /show/:id" do
        let(:category) {create(:category)}
        context " id exist" do
            before do
                get "/api/v1/category/show/#{category.id}"
            end
            it " return http status ok" do
                expect(response).to have_http_status(:ok)
            end
        end
        context " id not found" do
            before do
                get "/api/v1/category/show/-1"
            end
            it " return http status not found" do
                expect(response).to have_http_status(:not_found)
            end
        end
    end

    describe "POST /create" do
        let(:admin) {create(:admin)}
        let(:category_params) do
            attributes_for(:category)
        end
        context " params are ok" do
            it " return http status created" do
                post "/api/v1/category/create", params: {category: category_params}, headers: {
                    'X-Admin-Email': admin.email,
                    'X-Admin-Token': admin.authentication_token
                  }
                expect(response).to have_http_status(:created)
            end
        end
        context " with bad params" do
            it " when params are nil" do
                category_params = nil
                post "/api/v1/category/create", params: {category: category_params}, headers: {
                    'X-Admin-Email': admin.email,
                    'X-Admin-Token': admin.authentication_token
                  }
                expect(response).to have_http_status(:bad_request)
            end
            it " when params are not unique" do
                post "/api/v1/category/create", params: {category: category_params}, headers: {
                    'X-Admin-Email': admin.email,
                    'X-Admin-Token': admin.authentication_token
                  }
                post "/api/v1/category/create", params: {category: category_params}, headers: {
                    'X-Admin-Email': admin.email,
                    'X-Admin-Token': admin.authentication_token
                  }
                expect(response).to have_http_status(:bad_request)
            end
        end
    end

    describe "PATCH /update/:id" do
        let(:admin) {create(:admin)}
        let(:category1) {create(:category, name: 'Category1')}
        let(:category2) {create(:category, name: 'Category2')}
        let(:category_params) do
            attributes_for(:category)
        end
        context " params are ok" do
            it " return http status" do
                patch "/api/v1/category/update/#{category1.id}", params: {category: {name: "Eletrodomésticos"}}, headers: {
                    'X-Admin-Email': admin.email,
                    'X-Admin-Token': admin.authentication_token
                  }
                expect(response).to have_http_status(:ok)
            end
        end
        context " params are nil" do
            it " return http status bad_request" do
                patch "/api/v1/category/update/#{category1.id}", params: {category: {name: nil}}, headers: {
                    'X-Admin-Email': admin.email,
                    'X-Admin-Token': admin.authentication_token
                  }
                expect(response).to have_http_status(:bad_request)
            end
        end
        context " params are not unique" do
            it " return http status bad_request" do
                patch "/api/v1/category/update/#{category1.id}", params: {category: {name: category2.name}}, headers: {
                    'X-Admin-Email': admin.email,
                    'X-Admin-Token': admin.authentication_token
                  }
                expect(response).to have_http_status(:bad_request)
            end
        end
    end

    describe "DELETE /delete/:id" do
        let(:admin) {create(:admin)}
        let(:category) {create(:category)}
        context " category exists" do
            it " return http status ok" do
                delete "/api/v1/category/delete/#{category.id}", headers: {
                    'X-Admin-Email': admin.email,
                    'X-Admin-Token': admin.authentication_token
                  }
                expect(response).to have_http_status(:ok)
            end
        end
        context " category does not exists" do
            it " return http status bad_request" do
                delete "/api/v1/category/delete/-1", headers: {
                    'X-Admin-Email': admin.email,
                    'X-Admin-Token': admin.authentication_token
                  }
                expect(response).to have_http_status(:bad_request)
            end
        end
    end
end