class Api::V1::CartController < ApplicationController
    acts_as_token_authentication_handler_for User, only:[:create, :delete]
    def create
        cart = Cart.new(category_params)
        cart.save!
        render json: cart, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        cart = Cart.find(params[:id])
        cart.destroy!
        render json: cart, status: :ok
    rescue StandardError => e 
        render json: e, status: :bad_request
    end
end
