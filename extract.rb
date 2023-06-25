require "bundler/setup"
require "nokogiri"
require "json"

data = []

[1, 2].each do |page|
  doc = Nokogiri::HTML(File.read("page#{page}.html"))
  doc.css(".lister-item").each do |item|
    title = item.at("h3 a").text
    year = item.at(".lister-item-year").text[/\d+/]
    score = item.at(".ipl-rating-star__rating").text
    people = item.css(".text-muted")
      .find { |a| a.text.match?(/Director/) }
      .css("a, span")
      .map(&:text)
    directors = []
    actors = []
    collection = directors
    people.each do |person|
      case person
      when /\|/
        collection = actors
      else
        collection << person
      end
    end

    data << {
      title: title,
      year: year,
      score: score.to_f,
      directors: directors,
      actors: actors
    }
  end
end

puts JSON.pretty_generate(data)
