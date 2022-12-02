require 'rails_helper'

RSpec.describe "Api::V1::Carts", type: :request do
  describe "GET /show/:id" do
    let(:user) {create(:user, email:"teste@teste")}
    let(:cart) {create(:cart)}
    let(:cart_params) do
      attributes_for(:cart)
    end
    context " user id exist" do
      it " return http status ok" do
        get "/api/v1/cart/show/#{user.id}", params: {cart: cart_params}, headers: {
            'X-User-Email': user.email,
            'X-User-Token': user.authentication_token
          }  
        expect(response).to have_http_status(:ok)
      end
    end
    context " user id not found" do
      it " return http status not found" do
        get "/api/v1/cart/show/-1", params: {cart: cart_params}, headers: {
            'X-User-Email': user.email,
            'X-User-Token': user.authentication_token
          }  
        expect(response).to have_http_status(:not_found)
      end
    end
  end
  
  describe "POST /create" do
    let(:product) {create(:product)}
    let(:user) {create(:user)}
    let(:cart) {create(:cart)}
    let(:cart_params) do
      attributes_for(:cart).except(:user, :product).merge({ user_id: user.id, product_id: product.id })
    end
    context " params are ok" do
      it " return http status created" do
        post "/api/v1/cart/create", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    context " with bad params" do
      it " when params are nil" do
          cart_params = nil
          post "/api/v1/cart/create", params: {cart: cart_params}, headers: {
            'X-User-Email': user.email,
            'X-User-Token': user.authentication_token
          }
          expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "DELETE /delete/:id" do
    let(:product) {create(:product)}
    let(:user) {create(:user, email:"teste@teste")}
    let(:cart) {create(:cart)}
    context " cart exists" do
        it " return http status ok" do
            delete "/api/v1/cart/delete/#{cart.id}", headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:ok)
        end
    end
    context " cart does not exists" do
        it " return http status bad_request" do
            delete "/api/v1/cart/delete/-1", headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:bad_request)
        end
    end
  end
end
