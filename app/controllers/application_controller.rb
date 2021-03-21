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
      flash[:notice]="ログインが必要です"
      redirect_to login_path
    end
  end  
  
  
end
