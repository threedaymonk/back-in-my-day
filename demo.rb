$LOAD_PATH.unshift File.join(__dir__, "lib")

require "datastore/collection"
require "movie"

movies = Datastore::Collection.new("kaiju.json", Movie)

filtered = movies
  .select { |m| m in { title: /godzilla|gojira/i, score: 6.5.. } }
  .sort_by(&:year)

puts filtered.join("\n")
