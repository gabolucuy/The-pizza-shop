require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let!(:orders) { create_list(:order, 10) }
  let!(:order_id) { orders.last.id }

  describe "GET /orders" do
    before { get '/orders' }

    it "return all the orders" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    context "GET orders with non pizza orders" do
      let!(:orders) { create_list(:other_dish_order, 10) }
      let!(:order_id) { orders.last.id }
      before { get '/orders' }

      it "return all the orders" do
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end


  end

  describe "SHOW /orders/:id" do
    before { get "/orders/#{order_id}" }

    context "when the record exists" do
      it "return the order" do
        expect(json).not_to be_empty
        expect(json['id']).to eq( order_id )
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it "return state in preparation" do
        expect(json['state'].to_s).to match("In preparation")
      end
    end
    context "when the record does not exits" do
      let!(:order_id) { 20 }
      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Order/)
      end
    end
  end

  describe "POST /orders" do
    let!(:pizza) { create :pizza }
    let(:valid_attributes) { { pizza_id: pizza.id } }
    context "when the request is valid" do
      before { post '/orders', params: valid_attributes }

      it "creates a order" do
        expect(json['pizza_id']).to eq(pizza.id)
      end
      it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
    end

    context "when the request is invalid" do
      let(:invalid_attributes) { { pizza: '' } }
      before { post '/orders', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body).to match(/A pizza or other product must exist/)
      end

    end
  end

  describe "PUT /orders/:id" do
    let!(:pizza) { create :pizza }
    let(:valid_attributes) { { pizza_id: pizza.id } }
    context "when the record exist" do
      before { put "/orders/#{order_id}", params: valid_attributes }
      it "updates the record" do
        expect(json['pizza_id']).to eq(pizza.id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
    context "when the record does not exits" do
      let!(:order_id) { 20 }
      before { put "/orders/#{order_id}", params: valid_attributes }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Order/)
      end
    end
  end

  describe "DELETE /orders/:id" do
    before { delete "/orders/#{order_id}" }
    it "Returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

end
