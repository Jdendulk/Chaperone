class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :options_for_meeting_duration

  # for functionality of the simple form in create
  def options_for_meeting_duration
    [
      ['30 minutes', 30],
      ['1 hour', 60],
      ['2 hours', 120]
    ]
  end

end
