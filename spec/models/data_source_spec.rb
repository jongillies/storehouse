require 'spec_helper'

describe DataSource do

  describe 'minimum attributes required' do
    before(:each) do
      @attr = {
          name: 'Data Set 1',
          contact: 'user@example.com',
          description: 'description',
      }
    end

    it 'should create a new instance given valid attributes' do
      DataSource.create!(@attr)
    end

    it 'should require a name' do
      no_name_data_source = DataSource.new(@attr.merge(:name => ''))
      no_name_data_source.should_not be_valid
    end

    it 'should require a contact' do
      no_contact_data_source = DataSource.new(@attr.merge(:contact => ''))
      no_contact_data_source.should_not be_valid
    end

    it 'should require a description' do
      no_description_data_source = DataSource.new(@attr.merge(:description => ''))
      no_description_data_source.should_not be_valid
    end

    it 'should reject duplicate data_source.name' do
      DataSource.create!(@attr)
      data_source_with_duplicate_name = DataSource.new(@attr)
      data_source_with_duplicate_name.should_not be_valid
    end

  end

  describe 'maximum attributes' do
    before(:each) do
      @attr = {
          name: 'Data Set 1',
          contact: 'user@example.com',
          description: 'description',
          active: true
      }
    end

    it 'should create a new instance given valid attributes' do
      DataSource.create!(@attr)
    end

    it 'should require a name' do
      no_name_data_source = DataSource.new(@attr.merge(:name => ''))
      no_name_data_source.should_not be_valid
    end

    it 'should require a contact' do
      no_contact_data_source = DataSource.new(@attr.merge(:contact => ''))
      no_contact_data_source.should_not be_valid
    end

    it 'should require a description' do
      no_description_data_source = DataSource.new(@attr.merge(:description => ''))
      no_description_data_source.should_not be_valid
    end

    it 'should reject duplicate data_source.name' do
      DataSource.create!(@attr)
      data_source_with_duplicate_name = DataSource.new(@attr)
      data_source_with_duplicate_name.should_not be_valid
    end

  end

end
