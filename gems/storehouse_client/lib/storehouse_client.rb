require 'storehouse_client/version'
require 'yaml'
require 'crack'
require 'json'
require 'rest-client'
require 'digest'

module StorehouseClient

  YAML::ENGINE.yamler = 'syck'

  class API

    attr_reader :run_id, :data_source_id, :record_count, :error, :record_count

    def initialize(args)

      @error = nil
      @url = args.fetch(:url) { raise 'You must provide :url' }
      @api_version = args.fetch(:api_version) { 1 }
      @auth_token = args.fetch(:auth_token) { raise 'You must provide :auth_token' }
      @record_count = 0

      @resource = RestClient::Resource.new @url

    end

    def error?
      !@error.nil?
    end

    def data_sources
      get ("data_sources.json?auth_token=#{@auth_token}")
    end

    def start_run(data_source_id)

      @data_source_id = data_source_id

      run = {}
      run['export_run'] = {}
      run['export_run']['data_source_id'] = @data_source_id
      run['export_run']['started_at'] = Time.now

      r = post("api/#{@api_version}/export_runs?auth_token=#{@auth_token}", run)

      return nil if error?

      @run_id = r['response']['id']

      self
    end

    def finish_run

      run = {}
      run['export_run'] = {}
      run['export_run']['finished_at'] = Time.now.to_s
      run['export_run']['record_count'] = @record_count

      post("api/#{@api_version}/export_runs/#{@run_id}?auth_token=#{@auth_token}", run)

      return nil if error?

      self
    end

    def add_record(primary_key, data)

      e = {}
      e['export_record'] = {}
      e['export_record']['blob_attributes'] = {}
      e['export_record']['blob_attributes']['data'] = data
      e['export_record']['blob_attributes']['checksum'] = Digest::SHA256.hexdigest(data)
      e['export_record']['record_size'] = e['export_record']['blob_attributes']['data'].length
      e['export_record']['checksum'] = e['export_record']['blob_attributes']['checksum']
      e['export_record']['primary_key'] = primary_key
      e['export_record']['data_source_id'] = @data_source_id
      e['export_record']['export_run_id'] = @run_id

      post("api/#{@api_version}/export_records/?auth_token=#{@auth_token}", e)

      return nil if error?

      @record_count += 1

      self
    end

    private

    def post(path, data)
      begin
        result = @resource[path].post data.to_json, content_type: :json, accept: :json
      rescue RestClient::Unauthorized => @error
        return nil
      rescue RestClient::UnprocessableEntity => @error
        return nil
      rescue RestClient::ResourceNotFound => @error
        return nil
      end

      begin
        r = Crack::JSON.parse(result)
      rescue Exception => @error
        return nil
      end

      r
    end

    def get(path)
      result = @resource[path].get content_type: :json, accept: :json

      begin
        r = Crack::JSON.parse(result)
      rescue Exception => @error
        return nil
      end
      r

    end

    def get_run(run_id)
      get("api/#{@api_version}/export_runs/#{run_id}?auth_token=#{@auth_token}")
    end

  end

end
