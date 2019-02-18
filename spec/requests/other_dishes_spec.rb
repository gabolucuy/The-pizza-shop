require 'rails_helper'

RSpec.describe "OtherDishes", type: :request do
  let!(:other_dishes) { create_list(:other_dish, 10) }
  let!(:other_dish_id) { other_dishes.last.id }
  describe "GET /other_dishes" do
    before { get '/other_dishes' }

    it "returns all the other dishes of the Pizza Shop" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "SHOW /other_dishes" do
    before { get "/other_dishes/#{other_dish_id}" }

    context "when the record exists" do
      it "return the pizza type" do
        expect(json).not_to be_empty
        expect(json['id']).to eq( other_dish_id )
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context "when the record does not exits" do
      let!(:other_dish_id) { 20 }
      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find OtherDish/)
      end
    end
  end

  describe "POST /other_dishes" do
    let(:valid_attributes) { { name: 'Lasagna' } }
    context "when the request is valid" do
      before { post '/other_dishes', params: valid_attributes }

      it "creates a new dish" do
        expect(json['name']).to eq(valid_attributes[:name])
      end
      it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
    end

    context "when the request is invalid" do
      let(:invalid_attributes) { { name: '' } }
      before { post '/other_dishes', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body).to match("{\"name\":[\"can't be blank\"]}")
      end

    end
  end

  describe "PUT /other_dishes/:id" do
    let!(:valid_attributes) { { name: 'Lasagna' } }
    context "when the record exist" do
      before { put "/other_dishes/#{other_dish_id}", params: valid_attributes }
      it "updates the record" do
        expect(json['name']).to eq(valid_attributes[:name])
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
    context "when the record does not exits" do
      let!(:other_dish_id) { 20 }
      before { put "/other_dishes/#{other_dish_id}", params: valid_attributes }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find OtherDish/)
      end
    end
  end

  describe "DELETE /other_dishes/:id" do
    before { delete "/other_dishes/#{other_dish_id}" }
    it "Returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

end
