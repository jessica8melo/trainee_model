class Api::V1::CartController < ApplicationController
    
    acts_as_token_authentication_handler_for User, only:[:create, :delete, :show]
    def create
        cart = Cart.new(cart_params)
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

    def show
        cart = Cart.find(params[:current_user.id])
        render json: cart, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private
    
    def cart_params
        params.require(:cart).permit(:user_id, :product_id)
    end
end
