class TheaterMoviesController < ApplicationController
  before_action :set_theater, only: [:index, :new, :create]

  def index
    @theaterMovies = @theater.theater_movies
  end

  def new
    @theaterMovies = TheaterMovie.new(theater_id: @theater.id)
    @movie = Movie.all
  end

  def create
    attributes = {theater_movies_attributes: [{movie_id: params[:movie_id]}]}
    @theater.assign_attributes(attributes)
    return redirect_to theater_theater_movies_path if (@theater.save)

    render theater_theater_movie_path
  end

  def destroy
    @theaterMovies = TheaterMovie.find(params[:id])
    @theaterMovies.destroy
    return redirect_to theater_theater_movies_path
  end

  def set_theater
    @theater = Theater.find(params[:theater_id])
  end
end
