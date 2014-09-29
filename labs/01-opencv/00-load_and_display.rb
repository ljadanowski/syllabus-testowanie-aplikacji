#! /usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'bundler/setup'

require 'opencv'
include OpenCV

if ARGV.size == 0
  puts "Usage: ruby #{__FILE__} ImageToLoadAndDisplay"
  exit
end

image = nil
begin
  image = CvMat.load(ARGV[0], CV_LOAD_IMAGE_COLOR) # read the file
rescue
  puts 'Could not open or find the image.'
  exit
end

window = GUI::Window.new('Display window') # create a window for display
window.show(image)                         # show our image inside it

GUI::wait_key                              # wait for a keystroke in the window
