class AuditoriumsController < ApplicationController
  def index
    @theater = Theater.find(params[:theater_id])
    @auditoriums = Auditorium.where("theater_id='#{@theater.id}'")
  end

  def new
    @auditorium = Auditorium.new
  end

  def create
    @theater = Theater.find(params[:theater_id])
    attributes = {auditoriums_attributes: [auditorium_params]}
    @theater.assign_attributes(attributes)
    if @theater.save
      redirect_to theater_auditoriums_path(@theater.id)
    else
      @auditorium = Auditorium.new(auditorium_params)
      flash[:error] = @theater.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
    @auditorium = Auditorium.find(params[:id])
  end

  def update
    @theater = Theater.find(params[:theater_id])
    @auditorium = Auditorium.find(params[:id])
    if (@auditorium.update_attributes(auditorium_params))
      redirect_to theater_auditoriums_path(params[:theater_id])
    else
      #return render json: params
      flash[:error] = @auditorium.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    # return render json: params
    @auditorium = Auditorium.find(params[:id])
    @auditorium.destroy
    redirect_to theater_auditoriums_path
  end

  private
  def auditorium_params
    params.require(:auditorium).permit(:name, :capacity, :theater_id)
  end
end
