#!/usr/bin/env ruby2.1

require 'json'
require 'facets/hash'
require 'ampex'

hanzi_to_pinyin = JSON.parse open('hz2py.json').read
pinyin_to_hanzi = hanzi_to_pinyin.inverse.to_a
# migemo dictionary format
# 		Romaji<Tab>Word[<Tab>alternatives]
migemo_dict = pinyin_to_hanzi.map &X.join("\t")
open('migemo-dict-zh', 'w') { |f| f.puts migemo_dict }



