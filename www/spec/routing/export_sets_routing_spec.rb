require "spec_helper"

describe ExportSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/export_sets").should route_to("export_sets#index")
    end

    it "routes to #new" do
      get("/export_sets/new").should route_to("export_sets#new")
    end

    it "routes to #show" do
      get("/export_sets/1").should route_to("export_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/export_sets/1/edit").should route_to("export_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/export_sets").should route_to("export_sets#create")
    end

    it "routes to #update" do
      put("/export_sets/1").should route_to("export_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/export_sets/1").should route_to("export_sets#destroy", :id => "1")
    end

  end
end
