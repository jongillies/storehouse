require 'spec_helper'

describe Blob do

  before(:each) do
    @export_record = {
        checksum: '0000000',
        data: 'user@example.com'
    }
  end

  it 'should create a new blob given valid attributes' do
    Blob.create!(@export_record)
  end

  it 'should fail when trying to create a blog with the same checksum' do
    Blob.create!(@export_record)
    lambda { Blob.create!(@export_record) }.should raise_error(ActiveRecord::StatementInvalid)
  end

  it 'should fail when there is no checksum' do
    lambda { Blob.create!({ data: 'my_data'}) }.should raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should fail when there are no fields' do
    lambda { Blob.create!({ }) }.should raise_error(ActiveRecord::RecordInvalid)
  end

  # Old test.. should not be able to store binary data
  # it 'should accept binary data' do
  #   Blob.create!( checksum: '00000', data: "\xfe\xff\xfe\xff")
  # end

 end
