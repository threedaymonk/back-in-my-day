# coding = utf-8

class Movie
  attr_accessor :title, :year, :score, :directors, :actors

  def initialize(hash)
    hash.each do |key, value|
      send "#{key}=", value
    end
  end

  def to_s
    <<STRING
#{title}
  Year:     #{year}
  Score:    #{stars} #{format("%0.1f", score)}
  Director: #{directors.join(", ")}
  Actors:   #{actors.join(", ")}
STRING
  end

private
  def stars
    ("⭐" * score.floor) + ("・" * (10 - score.floor))
  end
end
