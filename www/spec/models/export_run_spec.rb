require 'spec_helper'

describe ExportRun do

  describe 'create export run' do

    before(:each) do
      @attr = {
          record_count: 100,
          data_source_id: 1,
          started_at: Time.now,
          finished_at: Time.now
      }
    end

    it 'should create a new instance given valid attributes' do
      ExportRun.create!(@attr)
    end

    it 'should fail missing required data_source_id' do
      check_required_field :data_source_id
    end

  end

  private

  def check_required_field(field)
    attr = @attr.clone

    er = ExportRun.create!(attr)

    eval ("er.#{field} = nil")

    er.save.should eq(false)
  end
end
