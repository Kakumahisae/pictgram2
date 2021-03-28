class CommentsController < ApplicationController
  
  
  def new
    @comment = Comment.new
    #@comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      render :new, danger: 'コメントに失敗しました'
    end  
  end
  
  
  def show
    @comment = Comment.find_by(id: params[:id])
    if @comment.user == current_user
      render "show"
    else
      flash[:danger] = "権限がありません"
      redirect_to topics_path
    end
  end
  
  def edit
    @comment = Comment.find_by(id: params[:id])
  end
  
  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      redirect_to topics_path, success: 'コメントを編集しました'
    else
       flash[:notice] = "編集に失敗しました"
       render "edit"
    end  
  end  
  
  
  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to topics_path, success: 'コメントを削除しました'
  end  
  
  private
    def comment_params
      params.require(:comment).permit(:comment,:topic_id)
    end  
end
