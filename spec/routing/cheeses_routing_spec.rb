require "rails_helper"

RSpec.describe CheesesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/cheeses").to route_to("cheeses#index")
    end

    it "routes to #show" do
      expect(:get => "/cheeses/1").to route_to("cheeses#show", :id => "1")
    end
    
  end
end
