require 'open-uri'
require 'pry'
require 'json'

class Scraper
@@students = []
def self.scrape_index_page(index_url)

doc = Nokogiri::HTML(open(index_url))
doc.css(".student-card").each do |student|
  # binding.pry
  scraped_student = {
  profile_url: student.css("a").collect {|student| student["href"]}[0],   #doc.css(".student-card a").collect {|link| link["href"]}
  name: student.css("h4").text,   #doc.css('h4').collect {|name| name.text}
  location: student.css("p").text,
}   #doc.css('p').collect {|location| location.text}
  @@students.push(scraped_student)
end

  # binding.pry
  @@students
end

def self.scrape_profile_page(profile_url)

end

end
