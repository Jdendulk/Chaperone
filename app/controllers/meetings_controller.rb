class MeetingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  #to instantiate the new meeting form containing who, what, where etc.
  def new
    @meeting = Meeting.new
    @friends = Friend.all
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @friends = Friend.all
    @meeting.user = current_user
    if @meeting.save
      redirect_to meeting_path(@meeting)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @friends = Friend.all
    @meeting = Meeting.find(params[:id])
    @share_code = params[:share_code]

    if @share_code && @meeting.user.share_code != @share_code
      redirect_to root_path, notice: "You are not allowed to see this meeting"
      return
    end

    if @share_code
      @no_mobile_nav = true
    end

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
  # def chat
  #   @`meeting = Meeting.find(params[:id])

  #   if @meeting.nil? || @meeting.user != current_user
  #     # User is allowed to access the meeting
  #   else
  #     # User is not allowed to access the meeting, redirect to home page
  #     redirect_to root_path, alert: "You are not authorized to access this page."
  #   end
  # end
  # chatroom and code to ensure meeting privacy
  def chat
    @meeting = Meeting.find(params[:id])

    if @meeting.nil? || @meeting.user != current_user
      # User is not allowed to access the meeting, redirect to home page
      redirect_to root_path, alert: "You are not authorized to access this page."
    else
      # User is allowed to access the meeting
    end
  end

  def extend
    @meeting = Meeting.find(params[:id])
    @meeting.update(extend_meeting_params)
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
    params.require(:meeting).permit(:start_time, :end_time, :date, :who, :what, :initial_meet_location, :latitude, :longitude, :fake_call, :how_did_it_go, :duration, friend_ids: [])
  end

  def extend_meeting_params
    params.require(:meeting).permit(:duration)
  end
end
