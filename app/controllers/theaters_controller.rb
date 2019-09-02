class TheatersController < ApplicationController
  def index
    @theaters = Theater.all
  end

  def new
    @theater = Theater.new
  end

  def create
    # Instantiate a new object using form parameters
    @theater = Theater.new(theater_params)
    # Save the object
    if @theater.save
      # if succeeds, redirect to the index action
      redirect_to (theaters_path)
    else
      # if fails, redisplay to fix the problems
      render('new')
    end
  end

  def show
    @theater = Theater.find(params[:id])
    @theaterMovies = @theater.movies
  end

  def edit
    @theater = Theater.find(params[:id])
  end

  def update
    @theater = Theater.find(params[:id])
    # Save the objece
    if (@theater.update_attributes(theater_params))
      # If update succeeds, redirect to index action
      redirect_to theaters_path
    else
      # If fails, redisplay to fix problems
      render('edit')
    end
  end

  def destroy
    @theater = Theater.find(params[:id])
    @theater.destroy
    redirect_to (theaters_path)
  end

  def disp

  end

  private
  def theater_params
    params.require(:theater).permit(:name)
  end
end
