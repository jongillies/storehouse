require 'storehouse_client/version'
require 'yaml'
require 'crack'
require 'json'
require 'rest-client'

module StorehouseClient

  YAML::ENGINE.yamler = 'syck'

  class API

    def initialize(args)

      @url = args.fetch(:url) { raise 'You must provide :url' }
      @auth_token = args.fetch(:auth_token) { raise 'You must provide :auth_token' }

      @resource = RestClient::Resource.new @url

    end

    def data_sources
      begin
        Crack::JSON.parse(@resource["data_sources.json?auth_token=#{@auth_token}"].get)
      rescue
      end
    end

    def start_run(data_source_id)

      if run_already_running(data_source_id)
        return false
      end

      create_run(data_source_id)
    end

    def finish_run(run_id)

      run = get_run(run_id)

    end

    private

    # Returns the run_id or nil if error
    def create_run(data_source_id)

      run = {}
      run['data_source_id'] = data_source_id
      run['started_at'] = Time.now

      result = @resource["export_runs?auth_token=#{@auth_token}"].post run.to_json, :content_type => :json, :accept => :json

      begin
        r = Crack::JSON.parse(result)
      rescue
        return nil
      end

      r['id']
    end

    def get_run(run_id)
      begin
        Crack::JSON.parse(@resource["export_runs.json/#{run_id}?auth_token=#{@auth_token}"].get)
      rescue
      end
    end

    def run_already_running(data_source_id)
      # select * from export_runs where data_source_id = '1' and started_at
      false
    end

  end

end
