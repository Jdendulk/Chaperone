class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :options_for_meeting_duration

  # for functionality of the simple form in create
  def options_for_meeting_duration
    [
      ['Select a time'],
      ['15 minutes', 15],
      ['30 minutes', 30],
      ['45 minutes', 45],
      ['1 hour', 60],
      ['2 hours', 120],
      ['2h:15min', 150],
      ['2h:30min', 180],
    ]
  end

end
