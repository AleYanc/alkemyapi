class ProductionsRepresenter
  def initialize(productions)
    @productions = productions
  end
  def as_json
    @productions.map do |production|
      {
        production_id: production.id,
        production_title: production.title,
        production_type: production.production_type,
        image: production.image
      } 
    end
  end
  private
    attr_reader :productions
end