class UsersController < ApplicationController
  
 
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録完了'
    else
      flash.now[:danger]= "登録失敗"
      render :new
    end  
  end
  
  
  def edit
    @user = current_user
  end  
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to root_path, success: "編集完了"
    else
      flash[:danger]="編集失敗"
      render :edit
    end  
  end  
    
  
  private
  
  #(name: params[:user][:name],  email: params[:user][:email]これが元々上に入ってた
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
    
end
