class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  add_flash_types :success, :info, :warning, :danger
  #flashのタイプわけの登録
  
  helper_method :current_user, :logged_in?
  
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to login_path
    end
  end  
end

######あとでワードに移行########
#頭に！がつく時、trueとfalseがひっくり返る。（真偽値逆転）
#後ろに？がつくと、真偽値を問いかけている。

#以下は ユーザーがログインしていれば true、その他なら false を返す
# def logged_in? ログインしてるのか？してるならtrue,してないならfalse
#    !current_user.nil? 上記を判断するのは!current_user.nil?
# end                   nil?はnilでならtrue,nilでなければfalse。!current_userはcurrentuserがいればfalse、いなければtrue。ふたつあわせると訳が分からない

# nil? はnilの場合のみtrueを返す。それ以外はfalse
# blank? はnil,false,"",半角スペース,空配列、空ハッシュの時trueを返す。これはrailsがないと使えない拡張メソッドで、 nil? と似ている。
# present? 上二つの真逆。nil,false,””,半角スペース,空配列,空ハッシュの以外の時にtrueを返す。中身がないとだめ。これも拡張メソッド。
#