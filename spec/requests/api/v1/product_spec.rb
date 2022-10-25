require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do
  describe "GET /index" do
    before do
      create(:product, id:1, name: "Adidas")
      create(:product, id:2, name: "Gucci")
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
          'created_at' => eval(Product.find(1).created_at.to_json),
          'id' => 1,
          'name' => 'Adidas',
          'updated_at' => eval(Product.find(1).created_at.to_json)
        },
        {
          'created_at' => eval(Product.find(2).created_at.to_json),
          'id' => 2,
          'name' => 'Gucci',
          'updated_at' => eval(Product.find(2).created_at.to_json)
        }
        ])
      end
    end
  end
end
