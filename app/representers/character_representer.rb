class CharacterRepresenter
  def initialize(character)
      @character = character
  end

  def as_json
      {
          id: character.id,
          name: character.name,
          age: character.age,
          weight_kg: character.weight,
          history: character.history,
          image: character.image,
          created_at: character.created_at,
          productions:
          begin
              character.productions.map do |production|
                  {
                    title: production.title
                  }
              end
          end
      }
  end

  private
  attr_reader :character
end