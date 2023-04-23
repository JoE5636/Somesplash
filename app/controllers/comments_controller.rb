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
    comment = Comment.find(params[:format])
    if comment.commentable_type == "Category"
      category = comment.commentable_id
      comment.destroy
      redirect_to category_path(category)
    else
      photo = comment.commentable_id
      comment.destroy
      redirect_to photo_path(photo)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
