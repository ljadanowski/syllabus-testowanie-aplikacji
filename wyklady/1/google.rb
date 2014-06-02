#!/bin/env ruby
# -*- coding: utf-8 -*-

require 'bundler/setup'

require 'nokogiri' # require your gems as usual
require 'open-uri'

arg = ARGV[0] || "news"
doc = Nokogiri::HTML(open("http://www.google.com/search?q=#{arg}"))

doc.css('h3.r a').each do |link|
  puts link.content
end
