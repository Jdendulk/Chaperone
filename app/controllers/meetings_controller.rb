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
        lng: location.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
    # unless @meeting.locations.last.nil?
    #   @markers = [{
    #     lat: @meeting.locations.last.latitude,
    #     lng: @meeting.locations.last.longitude,
    #     marker_html: render_to_string(partial: "marker")
    #   }]
    # end
    @timer = @meeting.duration
  end

  # chatroom
  # def chat
  #   @meeting = Meeting.find(params[:id])
  # end

  # chatroom and code to ensure meeting privacy
  def chat
    @meeting = Meeting.find_by(id: params[:id])

    if @meeting.nil? || @meeting.user != current_user
      # User is not allowed to access the meeting, redirect to home page
      redirect_to root_path, alert: "You are not authorized to access this page."
    else
      # User is allowed to access the meeting
    end
  end

  #updating of the meeting information tt
  def update
    meeting = Meeting.find(params[:id])
    meeting.update(end_time: Time.now)

    render json: { message: 'Thanks for telling us you are safe'}
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
    params.require(:meeting).permit(:start_time, :end_time, :date, :who, :what, :initial_meet_location, :latitude, :longitude, :fake_call, :how_did_it_go, :duration)
  end
end
