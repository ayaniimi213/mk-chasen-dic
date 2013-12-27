#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# convert from hatena keyword to chasen dic
# see はてなキーワード一覧ファイル - Hatena Developer Center http://developer.hatena.ne.jp/ja/documents/keyword/misc/catalog

require 'nkf'

cost = 5000

if ARGV.length == 1 then
  filename = ARGV.shift
else
  puts "Usage:#{$0} keywordlist_furigana.csv > hatena.dic"
  exit
end

open(filename){|file|
  file.each{|line|
    line.chomp!
    line = NKF.nkf('-w', line)
    (hira, title) = line.split("\t", 2)
    title.gsub!(/\(/, "（")
    title.gsub!(/\)/, "）")
    title.gsub!(/ /, "　")
    title.gsub!(/&amp;/, "＆")
    title.gsub!(/;/, "；")
    hira = title if hira == ""
    kana = NKF.nkf('-w --katakana', hira)

    puts "(品詞 (名詞 固有名詞 一般)) ((見出し語 (" + title + " " + cost.to_s + ")) (読み " + kana + ") )"
  }
}
