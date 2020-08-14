require 'open-uri'
require 'pry'
require 'json'

class Scraper
@@students = []
def self.scrape_index_page(index_url)

doc = Nokogiri::HTML(open(index_url))
doc.css(".student-card").each do |student|
  student_info = {}
  student_info[:student_links] = student.css("a")["href"]#doc.css(".student-card a").collect {|link| link["href"]}
  student_info[:student_names] = student.css("h4").text#doc.css('h4').collect {|name| name.text}
  student_info[:student_locations] = student.css("p").text#doc.css('p').collect {|location| location.text}
  @@students.push(student)
# binding.pry
@@students
  end
end

def self.scrape_profile_page(profile_url)

end

end
