require 'spec_helper'

describe ExportRecord do
  describe 'create export record' do

    before(:each) do
      @attr = {
          record_size: 100,
          checksum: 'zero',
          location_pointer: 'somewhere',
          primary_key: 'one',
          export_run_id: 1,
          data_source_id: 1
      }
    end

    it 'should create a new instance given valid attributes' do
      ExportRecord.create!(@attr)
    end

    it 'should fail missing required checksum' do
      check_required_field :checksum
    end

    it 'should fail missing required location_pointer' do
      check_required_field :location_pointer
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
      attr = @attr.clone

      er = ExportRecord.create!(attr)

      eval ("er.#{field} = nil")

      er.save.should eq(false)
    end
  end

end
