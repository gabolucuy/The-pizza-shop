require 'rails_helper'

RSpec.describe "Crusts", type: :request do
  let!(:crusts) { create_list(:crust, 10) }
  let!(:crust_id) { crusts.last.id }

  describe "GET /crusts" do
    before { get "/crusts" }
    it "returns all the crusts" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  describe "SHOW /crusts/:id" do
    before { get "/crusts/#{crust_id}" }
    context "when the records exists" do
      it "return the crust" do
        expect(json).not_to be_empty
        expect(json['id']).to eq( crust_id )
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context "when the recors does not exist" do
      let(:crust_id) { 20 }
      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Crust/)
      end
    end
  end
end
