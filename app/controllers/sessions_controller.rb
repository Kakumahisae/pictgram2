class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    # 送られてきたmailに一致するユーザーがいるか？で分岐
    user = User.find_by(email: params[:session][:email])
    # もしいた場合、そのユーザーが持つパスワードがparamsのpasswordと合っているかどうか
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログイン成功'
    # もしいない場合
    else
      flash.now[:danger]='パスワードまたはメールアドレスが不正です。'
      render :new
    end  
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end  
  
  private
  
  # もしuser && user.authenticateでクリアしたら、user.idがsession[:user_id]に代入されてﾛｸﾞｲﾝ状態になる
    def log_in(user)
      session[:user_id] = user.id
    end  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end  
    
end

