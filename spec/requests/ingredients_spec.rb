require 'rails_helper'

RSpec.describe "Ingredients", type: :request do
  let!(:ingredients) { create_list(:ingredient, 10) }
  let!(:ingredient_id) { ingredients.last.id }

  describe "GET /ingredients" do
    before { get '/ingredients' }
    it "returns all the ingredients" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "SHOW /ingredients/:id" do
    before { get "/ingredients/#{ingredient_id}" }

    context "when the record exists" do
      it "return the ingredient" do
        expect(json).not_to be_empty
        expect(json['id']).to eq( ingredient_id )
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context "when the record does not exits" do
      let!(:ingredient_id) { 20 }
      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Ingredient/)
      end
    end
  end

  describe "POST /ingredients" do
    let(:valid_attributes) { { name: 'Pineapple' } }
    context "when the request is valid" do
      before { post '/ingredients', params: valid_attributes }

      it "creates a pizza type" do
        expect(json['name']).to eq(valid_attributes[:name])
      end
      it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
    end

    context "when the request is invalid" do
      let(:invalid_attributes) { { name: '' } }
      before { post '/ingredients', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body).to match("{\"name\":[\"can't be blank\"]}")
      end

    end
  end

  describe "PUT /ingredients/:id" do
    let!(:valid_attributes) { { name: 'Pineapple' } }
    context "when the record exist" do
      before { put "/ingredients/#{ingredient_id}", params: valid_attributes }
      it "updates the record" do
        expect(json['name']).to eq(valid_attributes[:name])
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
    context "when the record does not exits" do
      let!(:ingredient_id) { 20 }
      before { put "/ingredients/#{ingredient_id}", params: valid_attributes }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Ingredient/)
      end
    end
  end

  describe "DELETE /ingredients/:id" do
    before { delete "/ingredients/#{ingredient_id}" }
    it "Returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

end
