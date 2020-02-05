# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'json'

url = 'https://www.welcometothejungle.com/fr/stacks?query=ruby&page=1&configure%5Bfilters%5D=website.reference%3Awttj_fr%20AND%20has_tech_page%3Atrue&configure%5BhitsPerPage%5D=30'

company = []

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.cVDSFP').each do |element|
  company << element.text.strip
  # brand = element.search('.brand').first.text.strip
  # class="sc-1rnf08o-5 cVDSFP"
  # price = element.search('.price')[0].text.strip

  # matches = price.match(/(?<integer>\d+),(?<decimal>\d+)/)
  # price = "#{matches[:integer]}.#{matches[:decimal]}".to_f

  # model = element.search('.model')[0].text.strip

  # shoes << {brand: brand, model: model, price: price}
  # puts "#{brand} / #{model} / #{price}"
  # puts element.attribute('href').value
end

p company

# File.open("shoes.json", 'wb') do |file|
#   file.write(JSON.pretty_generate(shoes))
# end

# def scrap_wtj_tech(tech)
#   doc = Nokogiri::HTML(open(url))
#   doc.search('body div div div main section div div ul li a header div h3 span')
#      .each_with_index do |e|
#         company = e.text
#       end
# end
# scrap_wtj_tech("ruby")
