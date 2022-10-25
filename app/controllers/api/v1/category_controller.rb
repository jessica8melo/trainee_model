class Api::V1::CategoryController < ApplicationController
    def index 
        category = Category.all 
        render json: category, status: :ok
    end

    def show
        category = Category.find(params[:id])
        render json: category, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        category = Category.new(category_params)
        category.save!
        render json: category, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        category = Category.find(params[:id])
        category.update!(category_params)
        render json: category, status: :ok
    rescue StandardError => e 
        render json: e, status: :bad_request
    end

    def delete
        category = Category.find(params[:id])
        category.destroy!
        render json: category, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
end
