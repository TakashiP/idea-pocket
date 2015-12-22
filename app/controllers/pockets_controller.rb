class PocketsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @pocket = current_user.pockets.build(micropost_params)
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
    flash[:success] = "ポケットを削除しました"
    redirect_to request.referrer || root_url
  end
  
  private
  def pocket_params
    params.require(:pocket).permit(:content)
  end
end
