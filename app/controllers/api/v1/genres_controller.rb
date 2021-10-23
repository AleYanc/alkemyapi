class Api::V1::GenresController < ApplicationController
  before_action :set_genre, only: [:show, :update, :destroy]
  MAX_PAGINATION_LIMIT = 10

  has_scope :by_name

  def index
    @genres = (apply_scopes(Genre.limit(limit).offset(params[:offset]))).order(created_at: order)
    render json: GenresRepresenter.new(@genres).as_json
  end

  def show
    render json: GenreRepresenter.new(@genre).as_json
  end 

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      render json: GenreRepresenter.new(@genre).as_json, status: :created
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  def update
    if @genre.update(genre_params)
      render json: GenreRepresenter.new(@genre).as_json
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @genre.destroy
  end

  private
    def limit
      [params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i].min
    end
    def genre_params
      params.permit(:name, :image)
    end
    def set_genre
      @genre = Genre.find(params[:id])
    end
    def order
      params.fetch(:order, :asc)
    end
end