class UsersController < ApplicationController

  def show # 追加
   @user = User.find(params[:id])
  end

  def new
      @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "アイデアポケットへようこそ!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

  def edit
    if @user != current_user
      redirect_to root_url
    end
  end
  
  def update
    if @user == current_user
      if @user.update(user_params)
        # 保存に成功した場合はプロフィールページへリダイレクト
        redirect_to @user , notice: 'プロフィールを編集しました'
      else
        # 保存に失敗した場合は編集画面へ戻す
        render 'edit'
      end
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
