#!/bin/env ruby
# -*- coding: utf-8 -*-

require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = "\nPrzekształacanie napisów.\n"
  opts.on("-u", "--upcase", "Zamień na wielkie litery") do |u|
    options[:upcase] = u
  end
  opts.on("-d", "--downcase", "Zamień na małe litery") do |d|
    options[:downcase] = d
  end
  opts.on("-r", "--reverse", "Wypisz od końca") do |r|
    options[:reverse] = r
  end
  opts.on("-h", "--help", "Wypisz pomoc") do
    puts opts
    exit
  end
end.parse!

words = []

# ARGV – arguments entered at the command line (but not options)

ARGV.each do |word|
  words << word.dup  # arguments are frozen
end

words.each do |word|
  word.upcase! if options[:upcase]
  word.downcase! if options[:downcase]
  word.reverse! if options[:reverse]

  puts word
end
