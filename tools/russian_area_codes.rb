#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

url = 'http://old.rt.ru/en/help-info/mg/index.php?SELECTED_CHAR='

codes = %w{A B C D E F G H I J K L M N O P R S T U V Y Z}.collect do |c|
  data = Nokogiri::HTML(open(url + c))
  data.css("table.fmain_table tbody tr td:nth-child(3)").collect {|e| e.text.split(/,/).collect {|str| str.strip } }
end.flatten.uniq.compact.reject {|str| str =~ /\D/ }

puts codes.join("|")
