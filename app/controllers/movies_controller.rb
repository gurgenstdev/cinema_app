class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    return redirect_to(movies_path) if (@movie.save)
    render('new')
  end

  def edit

  end

  def update
    return redirect_to movies_path if (@movie.update_attributes(movie_params))
    render('edit')
  end

  def destroy
    @movie.destroy
    return redirect_to movies_path
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :year, :rating, :genre, :duration)
  end
end
