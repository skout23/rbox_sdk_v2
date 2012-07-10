require 'spec_helper'

describe RboxSdkV2 do

  it "should work" do
    lambda do
      RboxSdkV2.get_authtoken()
    end.should_not raise_error
  end

  it "should return an auth token" do
    auth_token = RboxSdkV2.get_authtoken()
    auth_token.should_not be_nil
  end


end
