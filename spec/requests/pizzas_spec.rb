require 'rails_helper'

RSpec.describe "GET /pizzas", type: :request do
  let!(:pizzas) { create_list(:pizza, 10) }
  let!(:pizza_id) { pizzas.last.id }
  describe "GET /pizzas" do
    before { get '/pizzas' }
    it "all the pizzas" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "SHOW /pizzas/:id" do
    before { get "/pizzas/#{pizza_id}" }

    context "when the record exists" do
      it "return the pizza" do
        expect(json).not_to be_empty
        expect(json['id']).to eq( pizza_id )
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context "when the record does not exits" do
      let!(:pizza_id) { 20 }
      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Pizza/)
      end
    end
  end

  describe "POST /pizzas" do
    let!(:cheese) { create:cheese }
    let!(:crust) { create:crust }
    let!(:pizza_type) { create:pizza_type }
    let!(:sauce) { create:sauce }
    let!(:size) { create:size }
    let!(:valid_attributes) { {cheese_id: cheese.id, crust_id: crust.id, pizza_type_id: pizza_type.id, sauce_id: sauce.id, size_id: size.id} }

    context "when the request is valid" do
      before { post '/pizzas', params: valid_attributes }

      it "creates a pizza" do
        expect(json['cheese_id']).to eq(cheese.id)
      end
      it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
    end

    context "when the request is invalid" do
      let(:invalid_attributes) { { cheese_id: '', crust_id: crust.id, pizza_type_id: pizza_type.id, sauce_id: sauce.id, size_id: size.id } }
      before { post '/pizzas', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body).to match("{\"cheese\":[\"must exist\",\"can't be blank\"]}")
      end

    end
  end

  describe "PUT /pizzas/:id" do
    let!(:cheese) { create:cheese }
    let!(:crust) { create:crust }
    let!(:pizza_type) { create:pizza_type }
    let!(:sauce) { create:sauce }
    let!(:size) { create:size }
    let!(:valid_attributes) { {cheese_id: cheese.id, crust_id: crust.id, pizza_type_id: pizza_type.id, sauce_id: sauce.id, size_id: size.id} }
    context "when the record exist" do
      before { put "/pizzas/#{pizza_id}", params: valid_attributes }
      it "updates the record" do
        expect(json['cheese_id']).to eq(valid_attributes[:cheese_id])
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
    context "when the record does not exits" do
      let!(:pizza_id) { 20 }
      before { put "/pizzas/#{pizza_id}", params: valid_attributes }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Pizza/)
      end
    end
  end

  describe "DELETE /pizzas/:id" do
    before { delete "/pizzas/#{pizza_id}" }
    it "Returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

  describe "POST /pizza/:id/add_ingredient/:ingredient_id" do
    let!(:ingredient) { create :ingredient }
    let!(:pizza) { create :pizza }
    let!(:ingredient_ids) { [] }
    let!(:ingredients) { create_list:ingredient, 10 }
    before do
      ingredients.each do |ingredient|
        ingredient_ids<<ingredient.id
      end
    end
    context "when one ingredient is added" do
      before do
        ingredient_ids = []
        ingredient_ids<<ingredient.id
      end
      before { post "/pizzas/#{pizza.id}/add_ingredient",params: {ingredient_ids: ingredient_ids} }
      it "returns a status code 200" do
        expect(response).to have_http_status(200)
      end
    end
    context "when more than one ingredient is added" do

      before { post "/pizzas/#{pizza.id}/add_ingredient",params: {ingredient_ids: ingredient_ids} }
      it "returns a status code 200" do
        expect(response).to have_http_status(200)
      end
    end
  end
  describe "GET /pizza/:id/ingredients" do
    let!(:ingredient) { create :ingredient }
    let!(:pizza) { create :pizza }

    context "when the pizza has one ingredient added" do
      let!(:pizza_ingredients) { create :pizza_ingredient, pizza: pizza, ingredient:ingredient}
      before { get "/pizzas/#{pizza.id}/ingredients"}
      it "returns the ingredient added to the pizza" do
        expect(json.size).to eq(1)
      end
    end

    context "when the pizza has more than one ingredient added" do
      let!(:ingredient_ids) { [] }
      let!(:ingredients) { create_list:ingredient, 10 }
      before do
        ingredients.each do |ingredient|
          create :pizza_ingredient, pizza: pizza, ingredient:ingredient
          ingredient_ids<<ingredient.id
        end
      end
      before { get "/pizzas/#{pizza.id}/ingredients"}
      it "returns all ingredients added to the pizza" do
        expect(json.size).to eq(ingredients.size)
      end
    end
  end

end
