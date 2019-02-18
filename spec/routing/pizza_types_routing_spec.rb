require "rails_helper"

RSpec.describe PizzaTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/pizza_types").to route_to("pizza_types#index")
    end

    it "routes to #show" do
      expect(:get => "/pizza_types/1").to route_to("pizza_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/pizza_types").to route_to("pizza_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pizza_types/1").to route_to("pizza_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pizza_types/1").to route_to("pizza_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pizza_types/1").to route_to("pizza_types#destroy", :id => "1")
    end
  end
end
