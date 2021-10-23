class StudiosRepresenter
  def initialize(studios)
    @studios = studios
  end
  def as_json
    @studios.map do |studio|
      {
        studio_id: studio.id,
        studio_name: studio.name,
        studio_image: studio.image
      } 
    end
  end
  private
    attr_reader :productions
end