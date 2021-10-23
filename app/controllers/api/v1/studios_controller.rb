class Api::V1::StudiosController < ApplicationController
  before_action :set_studio, only: [:show, :update, :destroy]
  MAX_PAGINATION_LIMIT = 10

  has_scope :by_name

  def index
    @studios = (apply_scopes(Studio.limit(limit).offset(params[:offset]))).order(created_at: order)
    render json: StudiosRepresenter.new(@studios).as_json
  end
  
  def show
    render json: StudioRepresenter.new(@studio).as_json
  end

  def create
    @studio = Studio.new(studio_params)

    if @studio.save
      render json: StudioRepresenter.new(@studio).as_json, status: 200
    else
      render json: @studio.errors, status: :unprocessable_entity
    end
  end

  def update
    if @studio.update(studio_params)
      render json: StudioRepresenter.new(@studio).as_json
    else
      render json: @studio.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @studio.destroy
  end

  private

    def limit
      [params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i].min
    end
    def studio_params
      params.permit(:name, :image, {:production_ids => []}, {:character_ids => []})
    end

    def set_studio
      @studio = Studio.find(params[:id])
    end 

    def order
      params.fetch(:order, :asc)
    end

end