class LocationsController < ApplicationController
  protect_from_forgery with: :null_session

  # do I need to refer to lat, lng as I did for map?
  def update_location
    latitude = params[:latitude]
    longitude = params[:longitude]

    render json: { status: 'Location updated' }
  end
end
