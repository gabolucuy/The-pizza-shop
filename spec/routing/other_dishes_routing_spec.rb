require "rails_helper"

RSpec.describe OtherDishesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/other_dishes").to route_to("other_dishes#index")
    end

    it "routes to #show" do
      expect(:get => "/other_dishes/1").to route_to("other_dishes#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/other_dishes").to route_to("other_dishes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/other_dishes/1").to route_to("other_dishes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/other_dishes/1").to route_to("other_dishes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/other_dishes/1").to route_to("other_dishes#destroy", :id => "1")
    end
  end
end
