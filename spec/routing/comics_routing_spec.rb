require "rails_helper"

RSpec.describe ComicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/series/1/comics").to route_to("comics#index", series_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/series/1/comics/new").to route_to("comics#new", series_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/series/1/comics/1").to route_to("comics#show", id: '1', series_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/series/1/comics/1/edit").to route_to("comics#edit", id: '1', series_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/series/1/comics").to route_to("comics#create", series_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/series/1/comics/1").to route_to("comics#update", id: '1', series_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/series/1/comics/1").to route_to("comics#update", id: '1', series_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/series/1/comics/1").to route_to("comics#destroy", id: '1', series_id: '1')
    end
  end
end
