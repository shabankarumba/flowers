require "net/http"
require "active_support/core_ext"

desc "This imports XML data from an Arena Flowers website and saves it to the database" 
task :xml_import => :environment do |task,args|
  
  url = ["http://www.arenaflowers.com/files/sitemaps/arenaflowers.com/google_base_feed.xml", 
         "http://www.arenafleurs.fr/files/sitemaps/arenafleurs.fr/google_base_feed.xml", 
        "http://www.arenablumen.de/files/sitemaps/arenablumen.de/google_base_feed.xml"]

  url.each do |u|
    uri = URI(u)
    res = Net::HTTP.get(uri)

    xml = Hash.from_xml(res)
    items = xml["rss"]["channel"]["item"]

    items.each do |item|
      if Item.where(:country => item["tax"]["country"]).count < 5
        Item.find_or_create_by_title(:title => item["title"], :price => item["price"], 
          :description => item["description"], :currency => item["currency"], 
          :image_link => item["image_link"], :country => item["tax"]["country"])
      end
    end
  end
end