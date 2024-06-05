class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def edit
    @user = current_user
  end
end
