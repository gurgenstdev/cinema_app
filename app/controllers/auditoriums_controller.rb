class AuditoriumsController < ApplicationController
  def index
    @auditoriums = Auditorium.all
  end

  def new
    @auditorium = Auditorium.new
  end

  def create
    @auditorium = Auditorium.new(auditorium_params)
    if (@auditorium.save)
      redirect_to (auditoriums_path)
    else
      render 'new'
    end
  end

  def edit
    @auditorium = Auditorium.find(params[:id])
  end

  def update
    @auditorium = Auditorium.find(params[:id])
    if (@auditorium.update_attributes(auditorium_params))
      redirect_to auditoriums_path
    else
      render 'edit'
    end
  end

  def destroy
    @auditorium = Auditorium.find(params[:id])
    @auditorium.destroy
    redirect_to auditoriums_path
  end

  private
  def auditorium_params
    params.require(:auditorium).permit(:name, :capacity)
  end
end
