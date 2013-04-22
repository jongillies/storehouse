require "spec_helper"

describe ExportRecordsController do
  describe "routing" do

    it "routes to #index" do
      get("/export_records").should route_to("export_sets#index")
    end

    it "routes to #new" do
      get("/export_records/new").should route_to("export_records#new")
    end

    it "routes to #show" do
      get("/export_records/1").should route_to("export_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/export_records/1/edit").should route_to("export_records#edit", :id => "1")
    end

    it "routes to #create" do
      post("/export_records").should route_to("export_sets#create")
    end

    it "routes to #update" do
      put("/export_records/1").should route_to("export_records#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/export_records/1").should route_to("export_records#destroy", :id => "1")
    end

  end
end
