class MeetingsController < ApplicationController
  #to instantiate the new meeting form containing who, what, where etc.
  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    if @meeting.save
      redirect_to meeting_path(@meeting)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
    # question - is the geocoded.map finding a column within flats referring to geocoded.map or is it convention?
    @markers = @meeting.locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude
      }
    end
  end

  #chatroom
  def chat
    @meeting = Meeting.find(params[:id])
  end

  # how do we go about updating the long/lat throughout the meeting?

  # def update_location - need to create a long/lat table, as a meeting has many positions

  # end

  #updating of the meeting information
  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
  redirect_to meeting_path(@meeting)
  end

  # will this allow the user to cancel a future meeting?
  def cancel
    # Check that meeting start_time is before Time.zone.now (current_time) before deleting
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to meeting_path, status: :see_other
  end

  def howdiditgo
    @meeting = Meeting.find(params[:id])
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time, :date, :who, :what, :initial_meet_location, :latitude, :longitude, :fake_call, :how_did_it_go)
  end
end
