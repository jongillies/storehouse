require 'spec_helper'

describe ExportRecord do
  describe 'create export record' do

    before(:each) do
      @export_record = {
          record_size: 100,
          checksum: 'zero',
          location_pointer: 'somewhere',
          primary_key: 'one',
          export_run_id: 1,
          data_source_id: 1
      }

      @data_source = {
          :name => "Data Set 1",
          :contact => "user@example.com",
          :description => "description",
      }

      DataSource.create!(@data_source)
      @export_run = {
          record_count: 100,
          id: 1,
          data_source_id: 1,
          started_at: Time.now
          #finished_at: Time.now
      }

      ExportRun.create!(@export_run)

    end

    it 'should fail to create a duplicate' do
      ExportRecord.create!(@export_record)
      lambda { ExportRecord.create!(@export_record) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should create a new instance given valid attributes' do
      ExportRecord.create!(@export_record)
    end

    it 'should fail missing required checksum' do
      check_required_field :checksum
    end

    it 'should fail missing required primary_key' do
      check_required_field :primary_key
    end

    it 'should fail missing required export_run_id' do
      check_required_field :export_run_id
    end

    it 'should fail missing required data_source_id' do
      check_required_field :data_source_id
    end

    private

    def check_required_field(field)
      attr = @export_record.clone

      er = ExportRecord.create!(attr)

      eval ("er.#{field} = nil")

      er.save.should eq(false)
    end
  end

end
