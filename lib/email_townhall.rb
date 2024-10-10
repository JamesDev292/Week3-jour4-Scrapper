require 'open-uri'   #ouvrire un site web
require 'nokogiri'   #accèe à chaque noeud du site web pour scarp

# Définir la méthode pour obtenir les emails des mairies
def get_townhall_email(townhall_url)
    arr_city = Array.new
    townhall_url.xpath('//div[contains(@class, "infos__item -address")]/br/following-sibling::text()').each do |city|
        arr_city << city.text.strip
    end

    arr_mail = Array.new
    townhall_url.xpath('//p[contains(@class, "infos__item -email")]').each do |email| 
        arr_mail << email.text.strip 
    end

    hash_city = Hash[arr_city.zip(arr_mail)]
    return hash_city
end

# Fonction pour obtenir les URLs des mairies
def get_townhall_urls(page)
    arr_link = Array.new
    base_url = "https://www.aude.fr"
    page.xpath('//a[contains(@class,"directory-block__img-link composite-link")]').each do |links|
        arr_link << base_url + links.attr('href')
        
    end
    return arr_link
end


url = "https://www.aude.fr/annuaire-mairies-du-departement"
page = Nokogiri::HTML(URI.open(url)) 


townhall_urls = get_townhall_urls(page)  # Récupérer les URLs des mairies

townhall_urls.each do |url|  # Pour chaque URL
    townhall_url = Nokogiri::HTML(URI.open(url))  # Charger la page de la mairie
    # Appelle la méthode pour récupérer les emails
    puts get_townhall_email(townhall_url)
end





