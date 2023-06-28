# coding = utf-8

Movie = Struct.new(:title, :year, :score, :directors, :actors) do
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

  private def stars
    ("⭐" * score.floor).ljust(10, "・")
  end
end
