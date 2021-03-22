class CommentsController < ApplicationController
  
  
  def new
    @comment = Comment.new
    @comment.user_id = current_user.id
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
  
  private
    def comment_params
      params.require(:comment).permit(:comment,:topic_id)
    end  
end
