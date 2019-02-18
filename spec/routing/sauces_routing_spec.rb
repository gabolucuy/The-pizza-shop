require "rails_helper"

RSpec.describe SaucesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/sauces").to route_to("sauces#index")
    end

    it "routes to #show" do
      expect(:get => "/sauces/1").to route_to("sauces#show", :id => "1")
    end

  end
end
