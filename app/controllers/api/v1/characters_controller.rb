class Api::V1::CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]
  before_action :order_params
  MAX_PAGINATION_LIMIT = 10

  has_scope :by_name 
  has_scope :by_age, using: [:from, :to]
  has_scope :by_weight, using: [:from, :to]
  has_scope :by_production

  def index
    @characters = (apply_scopes(Character.limit(limit).offset(params[:offset]))).order(created_at: @order)
    render json: CharactersRepresenter.new(@characters).as_json
  end

  def show
    render json: CharacterRepresenter.new(@character).as_json
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      render json: CharacterRepresenter.new(@character).as_json, status: :created
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  def update
    if @character.update(character_params)
      render json: CharacterRepresenter.new(@character).as_json
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @character.destroy
  end

  private
    def limit
      [params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i].min
    end

    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.permit(:name, :age, :weight, :history, :image, {:production_ids => []})
    end 

    def order_params
      @order = params.fetch(:order, "ASC") 
    end

end