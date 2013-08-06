require 'spec_helper'

describe 'ExportRuns' do
  describe 'GET /export_runs' do
    it 'works! (now write some real specs)' do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get export_runs_path
      response.status.should be(200)
    end
  end
end
