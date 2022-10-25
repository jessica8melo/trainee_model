class Api::V1::BrandController < ApplicationController
    def index
        brand = Brand.all
        render json: brand, status: :ok
    end

    def show
        brand = Brand.find(params[:id])
        render json: brand, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        brand = Brand.new(brand_params)
        brand.save!
        render json: brand, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        brand = Brand.find(params[:id])
        brand.update!(brand_params)
        render json: brand, status: :ok
    rescue StandardError => e 
        render json: e, status: :bad_request
    end

    def delete
        brand = Brand.find(params[:id])
        brand.destroy!
        render json: brand, status: :ok
    rescue StandardError => e 
        render json: e, status: :bad_request
    end

    def brand_params
        params.require(:brand).permit(:name)
    end
end
