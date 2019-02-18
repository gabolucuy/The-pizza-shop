require "rails_helper"

RSpec.describe CrustsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/crusts").to route_to("crusts#index")
    end

    it "routes to #show" do
      expect(:get => "/crusts/1").to route_to("crusts#show", :id => "1")
    end

  end
end
