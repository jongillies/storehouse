require 'spec_helper'
require 'storehouse_client'

describe 'Initializing the class' do

  it 'should fail with no options' do
    expect { StorehouseClient::API.new({}) }.to raise_error
  end

  it 'should fail without the :url option' do
    expect { StorehouseClient::API.new(auth_token: 'z0000000000000000000') }.to raise_error
  end

  it 'should fail without the :auth_token option' do
    expect { StorehouseClient::API.new(url: 'http://localhost:3000') }.to raise_error
  end

  it 'should succeed with the proper options' do
    expect { StorehouseClient::API.new(url: 'http://localhost:3000', auth_token: 'z0000000000000000000') }.not_to raise_error
  end

end

describe 'Loading data_sources' do
   it 'should load the data sources' do
     sc = StorehouseClient::API.new(url: 'http://localhost:3000', auth_token: 'z0000000000000000000')
     sc.data_sources.count.should eq(4)
   end
end

describe 'Running records' do

  it 'should start a run' do
    sc = StorehouseClient::API.new(url: 'http://localhost:3000', auth_token: 'z0000000000000000000')
    ds = sc.data_sources

    run_id = sc.start_run(1)

    run_id.should eq(1)
  end
end


#describe 'Different Command Line Options' do
#  it 'should fail with no options' do
#    expect { StorehouseClient::GemName.new({}) }.to raise_error
#  end
#  #
#  it 'should succeed with minimum arguments' do
#    args = 'my-argument'
#    expect { StorehouseClient::GemName.new(args.shellsplit, "banner", "version") }.not_to raise_error
#  end
#end
