require 'rubygems'
require 'nokogiri'
require 'open-uri'




def recup_email_depute(url) 
     page = Nokogiri::HTML(open(url))
     
     selector = "//a[starts-with(@href, \"mailto:\")]/@href"
	   partie3 = page.xpath selector
     partie4 = partie3.collect {|n| n.value[7..-1]}  

      return partie4[0]
 end

def maliste_des_url_de_deputes
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
page.css('ul.col3/li/a').each do |link| 
url = "http://www2.assemblee-nationale.fr/" + link["href"][1..-1].to_s
nomdeput = link.text
emaildeput = recup_email_depute(url) 
mon_hash = {:nom => nomdeput,:email => emaildeput}
puts mon_hash
end
end

puts maliste_des_url_de_deputes

