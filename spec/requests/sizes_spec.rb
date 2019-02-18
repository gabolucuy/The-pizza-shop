require 'rails_helper'

RSpec.describe "Sizes", type: :request do
  let!(:sizes) { create_list(:size, 10) }
  let!(:size_id) { sizes.last.id }
  describe "GET /sizes" do
    before { get '/sizes' }
    it "return all the sizes" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "SHOW /sizes/:id" do
    before { get "/sizes/#{size_id}" }

    context "when the record exists" do
      it "returns the size " do
        expect(json).not_to be_empty
        expect(json['id']).to eq( size_id )
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:size_id) { 20 }
      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Size/)
      end
    end
  end

  describe "POST /sizes " do
    let(:valid_attributes) { { name: 'Personal', slices: 4 } }
    context "when the request is valid" do
      before { post '/sizes', params: valid_attributes }

      it "creates a new pizza size" do
        expect(json['name']).to eq(valid_attributes[:name])
        expect(json['slices']).to eq(valid_attributes[:slices])
      end
      it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
    end

    context "when the request is invalid" do
      let(:invalid_attributes) { { name: '',slices: '' } }
      before { post '/sizes', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body).to match("{\"name\":[\"can't be blank\"],\"slices\":[\"can't be blank\"]}")
      end

    end
  end

  describe "PUT /sizes/:id" do
    let!(:valid_attributes) { { name: 'Samll', slices: 6 } }
    context "when the record exist" do
      before { put "/sizes/#{size_id}", params: valid_attributes }
      it "updates the record" do
        expect(json['name']).to eq(valid_attributes[:name])
        expect(json['slices']).to eq(valid_attributes[:slices])
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
    context "when the record does not exits" do
      let!(:size_id) { 20 }
      before { put "/sizes/#{size_id}", params: valid_attributes }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Size/)
      end
    end
  end

  describe "DELETE /sizes/:id" do
    before { delete "/sizes/#{size_id}" }
    it "Returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
