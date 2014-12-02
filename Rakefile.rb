# by Jakukyo Friel <weakish@gmail.com> (http://weakish.github.io)
# under MIT

require 'json'
require 'open-uri'
require 'ampex'
require 'facets/hash'
require 'nokogiri'

task :convert do
	hanzi_to_pinyin = JSON.parse open('hz2py.json').read
	pinyin_to_hanzi = hanzi_to_pinyin.inverse.to_a
	# migemo dictionary format
	# 		Romaji<Tab>Word[<Tab>alternatives]
	migemo_dict = pinyin_to_hanzi.map &X.join("\t")
	open('migemo-dict-zh', 'w') { |f| f.puts migemo_dict }
end

task :download do
	hanzi_to_pinyin_url = 'https://github.com/wxianfeng/hanzi_to_pinyin_node/raw/master/lib/hz2py.json'
	hanzi_to_pinyin = open(hanzi_to_pinyin_url).read
	open('hz2py.json', 'w') { |f| f.puts hanzi_to_pinyin }
end

task :update do
	# get remote commit info
	hanzi_to_pinyin_histroy_url = 'https://github.com/wxianfeng/hanzi_to_pinyin_node/commits/master/lib/hz2py.json'
	html = Nokogiri::HTML open(hanzi_to_pinyin_histroy_url)
	remote_commit = html.css('div.commit-links-group.button-group a.sha.button-outline').first['href']

	# compared with local info
	local_commit = open('hz2py.json.commit').read

	if local_commit == remote_commit
		puts 'hz2py.json is already the newest.'
	else
		['downlad', 'update'].each { |t| Rake::Task[t].invoke }
	end
end

task :default => [:update]






