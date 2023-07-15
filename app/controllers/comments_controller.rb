class CommentsController < ApplicationController
  def index
  end

  def create
    @category = Category.find(params[:category_id])
    @comment = @category.comments.build(comment_params)

    if @comment.save
      redirect_to category_path(@category), notice: 'Comment was successfully created.'
    else
      redirect_to category_path(@category), alert: 'Comment creation failed.'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @comment = @category.comments.find(params[:id])
    @comment.destroy
    redirect_to category_path(@category), notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
