#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# convert from jawikipedia to chasen dic

require 'nkf'

cost = 5000

if ARGV.length == 1 then
  filename = ARGV.shift
else
  puts "Usage:#{$0} jawiki-latest-all-titles-in-ns0 > jawikipedia.dic"
  exit
end

open(filename){|file|
  file.each{|line|
    line.chomp!
    next if line.nil?
    title = line
    title.gsub!(/\(/, "（")
    title.gsub!(/\)/, "）")
    title.gsub!(/ /, "　")
    title.gsub!(/&amp;/, "＆")
    title.gsub!(/;/, "；")
    title.gsub!(/^"$/, "")
    title.gsub!(/^'$/, "")
    title.gsub!(/^\\$/, "")
    title.gsub!(/"/, "”")
    title.gsub!(/'/, "’")
    title.gsub!(/\\/, "￥")
    next if title.empty?
    kana = NKF.nkf('-w --katakana', title)
    
    puts "(品詞 (名詞 固有名詞 一般)) ((見出し語 (" + title.to_s + " " + cost.to_s + ")) (読み " + kana.to_s + ") )"
  }
}
