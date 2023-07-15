class CommentsController < ApplicationController
  before_action :set_category_or_photo, only: [:new, :create]
  before_action :set_comment, only: [:destroy]

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      redirect_to_commentable
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to_commentable
  end

  private

  def set_category_or_photo
    if params[:category_id]
      @commentable = Category.find(params[:category_id])
    elsif params[:photo_id]
      @commentable = Photo.find(params[:photo_id])
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def redirect_to_commentable
    if @commentable.is_a?(Category)
      redirect_to category_path(@commentable)
    elsif @commentable.is_a?(Photo)
      redirect_to photo_path(@commentable)
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :type)
  end
end
