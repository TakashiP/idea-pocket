class StaticPagesController < ApplicationController
  def home
    @pocket = current_user.pockets.build if logged_in?
  end
end
