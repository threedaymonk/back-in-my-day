Movie = Data.define(:title, :year, :score, :directors, :actors) do
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
