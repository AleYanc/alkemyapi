class StudioRepresenter
  def initialize(studio)
    @studio = studio
  end
  def as_json
    {
      id: studio.id,
      name: studio.name,
      image: studio.image,
      productions:
      begin
        studio.productions.map do |production|
          {
            title: production.title,
            production_type: production.production_type
          }
        end
      end,
      characters:
      begin
        studio.characters.map do |character|
          {
            name: character.name
          }
        end
      end
    }
  end
  private
  attr_reader :studio
end