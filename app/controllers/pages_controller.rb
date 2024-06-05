class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def form_page
  end

  def sessions_page
  end

end
