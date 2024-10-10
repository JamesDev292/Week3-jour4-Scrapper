require 'open-uri'   #ouvrire un site web
require 'nokogiri'   #accèe à chaque noeud du site web pour scarp

url = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(URI.open(url)) 


def scrap_names(page)
    arr_name = Array.new
    page.xpath('//td[contains(@class, "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol")]').each do |name|
    arr_name<< name.text
    end
    return arr_name
end

def scrap_price(page)
    arr_price = Array.new
    page.xpath('//td[contains(@class, "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price")]').each do |price|
    arr_price<< price.text
    end
    return arr_price
end

def scrap_crypto(page,arr_name,arr_price)

    hash_crypto = Hash[arr_name.zip(arr_price)]
    return hash_crypto
end 

names = scrap_names(page)
prices = scrap_price(page)

puts scrap_crypto(page,names,prices)


