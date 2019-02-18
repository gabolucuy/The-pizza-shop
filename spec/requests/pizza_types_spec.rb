require 'rails_helper'

RSpec.describe "PizzaTypes", type: :request do
  let!(:pizza_types) { create_list(:pizza_type, 10) }
  let!(:pizza_type_id) { pizza_types.last.id }

  describe "GET /pizza_types" do
    before { get '/pizza_types' }
    it "return all the pizza types" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "SHOW /pizza_types/:id" do
    before { get "/pizza_types/#{pizza_type_id}" }

    context "when the record exists" do
      it "return the pizza type" do
        expect(json).not_to be_empty
        expect(json['id']).to eq( pizza_type_id )
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context "when the record does not exits" do
      let!(:pizza_type_id) { 20 }
      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find PizzaType/)
      end
    end
  end

  describe "POST /pizza_types" do
    let(:valid_attributes) { { name: 'Hawaiian' } }
    context "when the request is valid" do
      before { post '/pizza_types', params: valid_attributes }

      it "creates a pizza type" do
        expect(json['name']).to eq('Hawaiian')
      end
      it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
    end

    context "when the request is invalid" do
      let(:invalid_attributes) { { name: '' } }
      before { post '/pizza_types', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end

    end
  end

  describe "PUT /pizza_types/:id" do
    let!(:valid_attributes) { { name: 'Hawaiian' } }
    context "when the record exist" do
      before { put "/pizza_types/#{pizza_type_id}", params: valid_attributes }
      it "updates the record" do
        expect(json['name']).to eq(valid_attributes[:name])
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
    context "when the record does not exits" do
      let!(:pizza_type_id) { 20 }
      before { put "/pizza_types/#{pizza_type_id}", params: valid_attributes }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find PizzaType/)
      end
    end
  end

  describe "DELETE /pizza_types/:id" do
    before { delete "/pizza_types/#{pizza_type_id}" }
    it "Returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
