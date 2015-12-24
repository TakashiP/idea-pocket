class StaticPagesController < ApplicationController
before_action :set_user, :set_pocket

  def home
    @user = current_user if logged_in?
    @pocket = current_user.pockets.build if logged_in?
    @idea = current_user.ideas.build if logged_in?
    @pockets = @user.pockets.order(created_at: :desc) if logged_in?
    @ideas = @user.ideas.order(created_at: :desc) if logged_in?
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def set_pocket
    @pocket = Pocket.find(params[:id])
  end
  
end
