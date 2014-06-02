#!/bin/env ruby
# -*- coding: utf-8 -*-

require 'bundler/setup'

require 'nokogiri' # require your gems as usual
require 'open-uri'

# get a Nokogiri::HTML::Document for the page we’re interested in...
doc = Nokogiri::HTML(open('http://www.google.com/search?q=rspec'))

# search for nodes by css
doc.css('h3.r a').each do |link|
  puts link.content
end
