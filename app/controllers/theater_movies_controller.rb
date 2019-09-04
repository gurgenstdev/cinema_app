class TheaterMoviesController < ApplicationController
  def index
    @theater = Theater.find(params[:theater_id])
    @theaterMovies = @theater.theater_movies
  end

  def new
    @theater = Theater.find(params[:theater_id])
    @theaterMovies = TheaterMovie.new(theater_id: @theater.id)
    @movie = Movie.all
  end

  def create
    #return render json: params
    @theater = Theater.find(params[:theater_id])
    attributes = {theater_movies_attributes: [{movie_id: params[:movie_id]}]}
    @theater.assign_attributes(attributes)
    if (@theater.save)
      redirect_to theater_theater_movies_path
    else
      render theater_theater_movie_path
    end
  end

  def destroy
    @theaterMovies = TheaterMovie.find(params[:id])
    @theaterMovies.destroy
    redirect_to theater_theater_movies_path
  end
end
