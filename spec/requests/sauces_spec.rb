require 'rails_helper'

RSpec.describe "Sauces", type: :request do
  let!(:sauces) { create_list(:sauce, 10) }
  let!(:sauce_id) { sauces.last.id }

  describe "GET /sauces" do
    before { get "/sauces" }
    it "return all the sauces" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "SHOW /sauces/:id" do
    before{ get "/sauces/#{sauce_id}" }
    context "when the record exists" do
      it "return the sauce" do
        expect(json).not_to be_empty
        expect(json['id']).to eq( sauce_id )
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context "when the record does not exist" do
      let(:sauce_id) {20}
      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Sauce/)
      end
    end
  end
end
