class ProductionRepresenter
  def initialize(production)
    @production = production
  end
  def as_json
    {
      id: production.id,
      title: production.title,
      type: production.production_type,
      released_date: production.released_date,
      score: production.score,
      image: production.image,
      genres:
      begin
        production.genres.map do |genre|
          {
            name: genre.name
          }
        end
      end,
      characters:
      begin
        production.characters.map do |character|
          {
            name: character.name
          }
        end
      end
    }
  end
  private
  attr_reader :production
end