class PocketsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def show
    @id = params[:id]
    @user = current_user if logged_in?
    @pocket = Pocket.find_by(params[:id])
    @idea = current_user.ideas.build if logged_in?
    @ideas  = @pocket.ideas
    @pockets = @user.pockets.order(created_at: :desc) if logged_in?
    render 'static_pages/home'
  end

  def create
    @pocket = current_user.pockets.build(pocket_params)
    if @pocket.save
      flash[:success] = "新しいアイデアポケットが生成されました！"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
    @pocket = current_user.pockets.find_by(id: params[:id])
    return redirect_to root_url if @pocket.nil?
    @pocket.destroy
    flash[:success] = "アイデアポケットが削除されました！"
    redirect_to request.referrer || root_url
  end
  
  private
  def pocket_params
    params.require(:pocket).permit(:content)
  end
end
