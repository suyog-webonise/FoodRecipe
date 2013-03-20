require 'nokogiri'
require 'rubygems'
require 'open-uri'
main_page = Nokogiri::HTML(open('http://www.indianfoodforever.com/'))
i = 1
main_page.css("div.top-link a").map do |cata|
  if i < 10
    Catagory.create(:name=>cata.content)
    cata_link = cata.attribute("href").to_s
    catagory_page = Nokogiri::HTML(open(cata_link))
    catagory_page.css("div.mainlinks > a").map do |reci|
      begin
        reci_link = reci.attribute("href").to_s
        recipe_page = Nokogiri::HTML(open(reci_link))
        Recipe.create(:catagory_id => i, :name => reci.content, :ingredients => recipe_page.css("div.text").inner_html, :procedure => recipe_page.css("ul").inner_html)
      rescue
        puts "PAGE NOT FOUND"
      end
    end
  end
  i = i + 1
end