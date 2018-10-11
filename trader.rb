require 'rubygems'
require 'nokogiri'
require 'open-uri'


def price_coin

  names = []
  price = []

    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    nomsdescoin = page.css('a.currency-name-container.link-secondary').each {|x| names << x.text}
 	nomsdesprix = page.css('a.price').each {|y| price << y.text }

  board = Hash[names.zip(price)]

 end


puts price_coin

# puts get_the_email_of_a_townhal_from_its_webpage

# def geta particular url of a page  
# def get_all_the_urls_of_val_doise_townhalls
# page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))  
# links = page.css(".lientxt")
# 	return links[2]["href"]
# end	

# puts get_all_the_urls_of_val_doise_townhalls	

#  def get_all_the_urls_of_val_doise_townhalls
#     doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
#     return doc.css(".lientxt").map { |link| link['href']}
# end    
# puts get_all_the_urls_of_val_doise_townhalls 

# ####################""
# def get_the_email_of_a_townhal_from_its_webpage(url) #récupère email dans la page url= général pour toutes les villes
#     page = Nokogiri::HTML(open(url))
#     return page.css(".tr-last")[3].text.split[2] #chemin pour avoir seulement l'email
# end

# def get_all_the_urls_of_val_doise_townhalls 
#     doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
#     return doc.css(".lientxt").each do |link| # prend les liens un par un pour aller récupérer l'email
#     url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s #création de la structure des liens
#     nom_villes = link.text #création des noms de villes à partir du lien cliquable  
#     email_villes = get_the_email_of_a_townhal_from_its_webpage(url) # on fait appel à la première méthode pour récupérer l'email
#     nom_mail = {:nom => nom_villes,:email => email_villes}
#     puts nom_mail
# end
