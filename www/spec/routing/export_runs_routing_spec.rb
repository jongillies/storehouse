require "spec_helper"

describe ExportRunsController do
  describe "routing" do

    it "routes to #index" do
      get("/export_runs").should route_to("export_runs#index")
    end

    it "routes to #show" do
      get("/export_runs/1").should route_to("export_runs#show", :id => "1")
    end

    it "routes to #create" do
      post("/export_runs").should route_to("export_runs#create")
    end

  end
end
