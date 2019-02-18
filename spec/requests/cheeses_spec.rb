require 'rails_helper'

RSpec.describe "Cheeses", type: :request do
  let!(:cheeses) { create_list(:cheese, 10) }
  let!(:chesse_id) { cheeses.last.id }
  describe "GET /cheese" do
    before { get '/cheeses' }
    it "returns all the cheese" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "SHOW /cheese/:id" do
    before { get "/cheeses/#{chesse_id}" }
    context "when the record exists" do
      it "return the cheese" do
        expect(json).not_to be_empty
        expect(json['id']).to eq(chesse_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context "when the record does not exists" do
      let(:chesse_id) { 20 }
      it "return status code 404" do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Cheese/)
      end
    end
  end
end
