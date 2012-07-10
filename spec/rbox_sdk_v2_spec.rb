require 'spec_helper'

describe RboxSdkV2 do

=begin

    def self.get_ticket
    def self.auth_ticket(ticket)
    def self.get_auth_token(ticket)
=end


  it "should get ticket" do
   lambda do
      rbox_ticket = RboxSdkV2::Client.get_ticket()
    end.should_not raise_error
  end
  
      puts @rbox_ticket
  it "should authorize ticket request" do
    lambda do
      rbox_ticket = RboxSdkV2::Client.get_ticket()
      rbox_auth_ticket = RboxSdkV2::Client.auth_ticket(rbox_ticket) 
    end.should_not raise_error 
  end

  it "should return an auth token" do
    lambda do
      rbox_ticket = RboxSdkV2::Client.get_ticket()
      rbox_auth_ticket = RboxSdkV2::Client.auth_ticket(rbox_ticket)
      auth_token = RboxSdkV2::Client.get_auth_token(rbox_ticket)
      puts auth_token.class
      puts auth_token.size
      puts auth_token.inspect
      auth_token.should_not be_nil
    end.should_not raise_error
  end

end
