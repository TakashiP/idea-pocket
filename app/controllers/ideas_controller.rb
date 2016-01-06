class IdeasController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @idea = current_user.ideas.build(idea_params)
    if @idea.save
      flash[:success] = "アイデアが生成されました！"
      redirect_to root_url
    else
      @pocket = Pocket.new
      @user = current_user if logged_in?
      @pockets = @user.pockets.order(created_at: :desc) if logged_in?
      @ideas = @user.ideas.order(created_at: :desc) if logged_in?
      #@idea = Idea.new
      #入力フォーム＋エラーメッセージ
      render 'static_pages/home'
    end
  end
  
  def destroy
    @idea = current_user.ideas.find_by(id: params[:id])
    return redirect_to root_url if @idea.nil?
    @idea.destroy
    flash[:success] = "アイデアが削除されました！"
    redirect_to request.referrer || root_url
  end
  
  private
  def idea_params
    params.require(:idea).permit(:content, :pocket_id)
  end

end
