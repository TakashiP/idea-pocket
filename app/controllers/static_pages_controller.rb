class StaticPagesController < ApplicationController

  def home
    @user = current_user if logged_in?
    @pocket = current_user.pockets.build if logged_in?
    @idea = current_user.ideas.build if logged_in?
    @pockets = @user.pockets.order(created_at: :desc) if logged_in?
    @ideas = @user.ideas.order(created_at: :desc) if logged_in?
  end
  
end
