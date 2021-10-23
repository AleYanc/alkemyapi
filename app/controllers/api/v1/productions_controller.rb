class Api::V1::ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :update, :destroy]
  MAX_PAGINATION_LIMIT = 10

  has_scope :by_title
  has_scope :by_genre

  def index
    @productions = (apply_scopes(Production.limit(limit).offset(params[:offset]))).order(created_at: order)
    render json: ProductionsRepresenter.new(@productions).as_json
  end

  def show
    render json: ProductionRepresenter.new(@production).as_json
  end 

  def create
    @production = Production.new(production_params)
    if @production.save
      render json: ProductionRepresenter.new(@production).as_json
    else
      render json: @production.errors, status: :unprocessable_entity
    end
  end

  def update
    if @production.update(production_params)
      render json: ProductionRepresenter.new(@production).as_json, status: 200
    else
      render json: @production.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @production.destroy
  end
  

  private
    def limit
      [params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i].min
    end

    def production_params
      params.permit(:title, :released_date, :score, :image, :production_type, {:character_ids => []}, {:genre_ids => []})
    end

    def set_production
      @production = Production.find(params[:id])
    end

    def order
      params.fetch(:order, :asc)
    end
    
end