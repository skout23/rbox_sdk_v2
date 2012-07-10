require "rbox_sdk_v2/version"
require "rbox_sdk_v2/config"

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'

=begin

API_KEY='SCRUBBED'
USER='SCRUBBED'
PASS='SCRUBBED'
V1URL='https://www.box.com/api/1.0'
V2URL='https://www.box.com/api/2.0'

=end

module RboxSdkV2

  class Client

    def self.get_ticket
      begin
        doc = Nokogiri::XML(open("#{V1URL}/rest?action=get_ticket&api_key=#{API_KEY}"))
        return doc.xpath('//response/ticket').inner_text
      rescue => e
        puts e.backtrace
        exit
      end
    end

    def self.auth_ticket(ticket)
      begin
        agent = Mechanize.new
        page = agent.get("https://www.box.com/api/1.0//auth/#{ticket}")
        boxnetform=page.form('login_form1')
        boxnetform.login = "#{USER}"
        boxnetform.password = "#{PASS}"
        page2 = agent.submit(boxnetform, boxnetform.buttons.first)
        form = page2.forms.first
        form.login = "#{USER}"
        form.password = "#{PASS}"
        page3 = agent.submit(form, form.buttons.first)
        sleep 2
        return "done"
      rescue => e
       puts e.backtrace
       exit
      end
    end

    def self.get_auth_token(ticket)
      begin
        doc = Nokogiri::XML(open("https://www.box.com/api/1.0/rest?action=get_auth_token&api_key=#{API_KEY}&ticket=#{ticket}"))
        return doc.xpath('//response/auth_token').inner_text
      rescue => e
        puts e.backtrace
        exit
      end
    end

  end
end
