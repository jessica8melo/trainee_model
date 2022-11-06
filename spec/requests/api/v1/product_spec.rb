require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do
  describe "GET /index" do
    before do
      create(:category, id:1, name: "Lazer")
      create(:category, id:2, name: "Móveis")
      create(:brand, id:1, name: "Penalty")
      create(:brand, id:2, name: "Castor")
      create(:product, id:1, name: "Bola de Futebol", price:1, brand_id:1, category_id:1, description: "Para jogar futebol", inventory: 1)
      create(:product, id:2, name: "Cama", price:2, brand_id:2, category_id:2, description: "Para deitar-se", inventory: 2)
    end
    context " when index return" do
      before do
        get "/api/v1/product/index"
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
          'images_url' => [],
          'name' => 'Bola de Futebol',
          'price' => 1,
          'brand' => {"id" => 1, "name" => 'Penalty', 'image_url' => nil},
          'category' => {"id" => 1, "name" => 'Lazer'},
          'description' => 'Para jogar futebol',
          'inventory' => 1
        },
        {
          'id' => 2,
          'images_url' => [],
          'name' => 'Cama',
          'price' => 2,
          'brand' => {"id" => 2, "name" => 'Castor', 'image_url' => nil},
          'category' => {"id" => 2, "name" => 'Móveis'},
          'description' => 'Para deitar-se',
          'inventory' => 2
        }
        ])
      end
    end
  end

  describe "GET /show/:id" do
    let(:product) {create(:product)}
    context " id exist" do
        before do
            get "/api/v1/product/show/#{product.id}"
        end
        it " return http status ok" do
            expect(response).to have_http_status(:ok)
        end
    end
    context " id not found" do
        before do
            get "/api/v1/product/show/-1"
        end
        it " return http status not found" do
            expect(response).to have_http_status(:not_found)
        end
    end
  end

  describe "POST /create" do
    let(:user) {create(:user, is_admin: true)}
    let(:category) {create(:category)}
    let(:brand)  {create(:brand)}
    let(:product_params) do
        attributes_for(:product).except(:category, :brand).merge({ category_id: category.id, brand_id: brand.id })
    end
    context " params are ok" do
        it " return http status created" do
            post "/api/v1/product/create", params: {product: product_params}, headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:created)
        end
    end
    context " with bad params" do
        it " when params are nil" do
            product_params = nil
            post "/api/v1/product/create", params: {product: product_params}, headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:bad_request)
        end
        it " when params are not unique" do
            post "/api/v1/product/create", params: {product: product_params}, headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            post "/api/v1/product/create", params: {product: product_params}, headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:bad_request)
        end
    end
  end

  describe "PATCH /update/:id" do
    let(:user) {create(:user, is_admin: true)}
    let(:product1) {create(:product, name: 'Product1')}
    let(:product2) {create(:product, name: 'Product2')}
    let(:product_params) do
        attributes_for(:product)
    end
    context " params are ok" do
        it " return http status" do
            patch "/api/v1/product/update/#{product1.id}", params: {product: {name: "Refrigerante"}}, headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:ok)
        end
    end
    context " params are nil" do
        it " return http status bad_request" do
            patch "/api/v1/product/update/#{product1.id}", params: {product: {name: nil}}, headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:bad_request)
        end
    end
    context " params are not unique" do
        it " return http status bad_request" do
            patch "/api/v1/product/update/#{product1.id}", params: {product: {name: product2.name}}, headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:bad_request)
        end
    end
  end

  describe "DELETE /delete/:id" do
    let(:user) {create(:user, is_admin: true)}
    let(:product) {create(:product)}
    context " product exists" do
        it " return http status ok" do
            delete "/api/v1/product/delete/#{product.id}", headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:ok)
        end
    end
    context " product does not exists" do
        it " return http status bad_request" do
            delete "/api/v1/product/delete/-1", headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:bad_request)
        end
    end
  end
end
