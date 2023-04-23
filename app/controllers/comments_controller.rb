class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save      
      redirect_to category_path(comment.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
