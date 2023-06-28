$LOAD_PATH.unshift File.join(__dir__, "lib")

require "datastore/collection"
require "movie"

def filter(movies)
  movies
    .select { |m|
      case m
      in { title: /godzilla|gojira/i, score: 6.5.. }
        true
      else
        false
      end
    }
    .sort_by(&:year)
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
