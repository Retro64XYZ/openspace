class LocationsController < ApplicationController
  load_and_authorize_resource

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(params[:location])
    @location.event_id = current_event

    if @location.save
      redirect_to edit_event_path(current_event), notice: 'Ambiente creado.'
    else
      render action: "new"
    end
  end

  def update
    @location = Location.find(params[:id])

    if @location.update_attributes(params[:location])
      redirect_to edit_event_path(current_event), notice: 'Ambiente actualizado.'
    else
      render action: "edit"
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to edit_event_path(current_event), notice: 'Ambiente eliminado.'
  end
end