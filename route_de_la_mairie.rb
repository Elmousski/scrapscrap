require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))   
	page.css(".txt-primary")[3].text.split[2]
	########pour une class c'est .le nom de la classe ?
end
puts get_the_email_of_a_townhal_from_its_webpage

x = "=" * 30
puts x

def get_all_the_urls_of_val_doise_townhalls
    page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
    page.css(".lientxt").each do |url| 
# pour une ligne comme ça, <a class="lientxt" href="./95/saint-prix.html">SAINT PRIX</a> 
     	puts "http://annuaire-des-mairies.com/" + url["href"][1..-1].to_s
# on prend la partie texte ou la partie URL tuto > http://ruby.bastardsbook.com/chapters/html-parsing/ "Get an attribute element".
# Au début, j'avais laissé ma structure d'url avec un . parceque ca marche aussi, j'ai réussi à l'enlever avec "[1..-1].to_s" mais je ne comprends pas pourquoi ?
     end
end

puts get_all_the_urls_of_val_doise_townhalls

x = "=" * 30
puts x

def get_all_the_name_of_val_doise_townhalls
    page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
    page.css(".lientxt").each do |url| 
     	puts url.text
     end
end

puts get_all_the_name_of_val_doise_townhalls


########Comment utiliser les méthodes dans le même fichier ? Je n'ai pas réussi. 

# def le_superhash

# end
# 	url = get_all_the_urls_of_val_doise_townhalls
# 	villes = get_all_the_name_of_val_doise_townhalls
# 	email = get_the_email_of_a_townhal_from_its_webpage

# 	x = get_the_email_of_a_townhal_from_its_webpage(url)

# 	super_hash = {:nom => villes,:email => x}
# 	return super_fufu

# end

# puts la_super_fusion
