require "spec_helper"

describe ExportRecordsController do
  describe "routing" do

    it "routes to #index" do
      get("/export_records").should route_to("export_records#index")
    end

    it "routes to #show" do
      get("/export_records/1").should route_to("export_records#show", :id => "1")
    end

    it "routes to #create" do
      post("/export_records").should route_to("export_records#create")
    end

  end
end
