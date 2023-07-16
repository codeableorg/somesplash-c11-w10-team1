class CommentsController < ApplicationController
  def index
  end

    def create
      if params[:category_id]
        @category = Category.find(params[:category_id])
        @comment = @category.comments.build(comment_params)
      elsif params[:photo_id]
        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.build(comment_params)
      end
  
      if @comment.save
        redirect_to @category || @photo, notice: "Comment created successfully."
      else
        if @category
          redirect_to category_path(@category), alert: "Error creating comment."
        elsif @photo
          redirect_to photo_path(@photo), alert: "Error creating comment."
        end
      end
    end

  def destroy
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @comment = @category.comments.find(params[:id])
    elsif params[:photo_id]
      @photo = Photo.find(params[:photo_id])
      @comment = @photo.comments.find(params[:id])
    end

    if @comment.destroy
      redirect_to (@category || @photo), notice: "Comment deleted successfully."
    else
      redirect_to root_path, alert: "Error deleting comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
