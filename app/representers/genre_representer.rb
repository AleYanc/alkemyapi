class GenreRepresenter
  def initialize(genre)
      @genre = genre
  end

  def as_json
      {
          id: genre.id,
          name: genre.name
      }
  end
  private
  attr_reader :genre
end