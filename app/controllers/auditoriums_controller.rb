class AuditoriumsController < ApplicationController
  before_action :set_theater, only: [:index, :create, :update]

  def index
    @auditoriums = Auditorium.where("theater_id='#{@theater.id}'")
  end

  def new
    @auditorium = Auditorium.new
  end

  def create
    attributes = {auditoriums_attributes: [auditorium_params]}
    @theater.assign_attributes(attributes)
    return redirect_to theater_auditoriums_path(@theater.id) if @theater.save

    @auditorium = Auditorium.new(auditorium_params)
    flash[:error] = @theater.errors.full_messages.to_sentence
    render 'new'
  end

  def edit
    @auditorium = Auditorium.find(params[:id])
  end

  def update
    @auditorium = Auditorium.find(params[:id])
    return redirect_to theater_auditoriums_path(params[:theater_id]) if (@auditorium.update_attributes(auditorium_params))

    flash[:error] = @auditorium.errors.full_messages.to_sentence
    render 'edit'
  end

  def destroy
    @auditorium = Auditorium.find(params[:id])
    @auditorium.destroy
    return redirect_to theater_auditoriums_path
  end

  private

  def set_theater
    @theater = Theater.find(params[:theater_id])
  end

  def auditorium_params
    params.require(:auditorium).permit(:name, :capacity, :theater_id)
  end
end
