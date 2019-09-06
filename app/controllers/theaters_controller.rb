class TheatersController < ApplicationController
  before_action :set_theater, only: [:show, :edit, :update, :destroy]

  def index
    @theaters = Theater.all
  end

  def new
    @theater = Theater.new
  end

  def create
    @theater = Theater.new(theater_params)
    return redirect_to (theaters_path) if @theater.save
    render('new')
  end

  def show

  end

  def edit

  end

  def update
    return redirect_to theaters_path if (@theater.update_attributes(theater_params))
    render('edit')
  end

  def destroy
    @theater.destroy
    redirect_to (theaters_path)
  end

  private
  def set_theater
    @theater = Theater.find(params[:id])
  end

  def theater_params
    params.require(:theater).permit(:name, :email, :address, :phone_number)
  end
end
