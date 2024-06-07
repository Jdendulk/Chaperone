class LocationsController < ApplicationController
  protect_from_forgery with: :null_session

  # do I need to refer to lat, lng as I did for map?

  def create
    # binding.break

    latitude = params[:latitude]
    longitude = params[:longitude]
    puts latitude
    puts longitude
    @meeting = Meeting.find(params[:meeting_id])
    @location = Location.new(latitude: latitude, longitude: longitude, meeting: @meeting)
    @location.save

    respond_to do |format|
      format.json { render json: @location }
    end
  end

  # def update
  #   @location = Location.find(params[:id])
  #   if @location.update(location_params)
  #     render json: @location, status: :ok
  #   else
  #     render json: @location.errors, status: :unprocessessable_entity
  #   end
  # end

  def update_location
    # following lines extract the lat/long parameters from the request sent bu JS frontend
    latitude = params[:latitude]
    longitude = params[:longitude]

    # following line updates the lat/long attributes
    current_user.update(latitude: latitude, longitude: longitude)

    # after updating, the action renders a JSON response indicating location was successfully updates
    render json: { status: 'Location updated' }
  end

  private

  def location_params
    params.require(:location).permit(:longitude, :latitude)
  end
end
