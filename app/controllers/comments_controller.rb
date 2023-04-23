class CommentsController < ApplicationController
  def show
    
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comment_path(@comment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    comment = comment.find(params[:id])
    comment.destroy
    redirect_to comment_path, status: :see_other
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :id)
  end


end

