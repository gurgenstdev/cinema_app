class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    # Instantiate a new object using form parameters
    @movie = Movie.new(movie_params)
    if (@movie.save)
      # if succeeds, redirect to the index action
      redirect_to(movies_path)
    else
      # if fails, redisplay to fix the problems
      render('new')
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if (@movie.update_attributes(movie_params))
      # If update succeeds, redirect to index action
      redirect_to movies_path
    else
      # If fails, redisplay to fix problems
      render('edit')
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :year, :rating, :genre, :duration)
  end
end
