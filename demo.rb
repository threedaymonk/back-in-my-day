$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "lib")

require "datastore/collection"
require "movie"

def filter(movies)
  movies.
    select { |m| m.title =~ /godzilla|gojira/i && m.score >= 6.5 }.
    sort_by { |m| m.year }
end

movies = Datastore::Collection.new("kaiju.json", Movie)

if ARGV.first == "benchmark"
  require "benchmark"

  Benchmark.bm do |bm|
    bm.report do
      10_000.times do
        filtered = filter(movies)
      end
    end
  end
else
  filtered = filter(movies)
  puts filtered.join("\n")
end
