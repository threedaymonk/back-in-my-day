Movie = Struct.new(:title, :year, :score, :directors, :actors, keyword_init: true) do
  def to_s
    <<~STRING
      #{title}
        Year:     #{year}
        Score:    #{stars} #{format("%0.1f", score)}
        Director: #{directors.join(", ")}
        Actors:   #{actors.join(", ")}
    STRING
  end

  private def stars = ("⭐" * score.floor).ljust(10, "・")
end
