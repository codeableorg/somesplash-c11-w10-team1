class CommentsController < ApplicationController
    def new
      if params[:category_id]
        @category = Category.find(params[:category_id])
        @comment = @category.comments.new
      else
        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.new
      end
    end
  
    def create
      if params[:category_id]
        @category = Category.find(params[:category_id])
        @comment = @category.comments.new(comment_params)
      else
        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.new(comment_params)
      end
  
      if @comment.save && params[:category_id]
        redirect_to category_path(@category)
      elsif @comment.save && params[:photo_id]
        redirect_to photo_path(@photo)
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      @comment = Comment.find(params[:category_id])
      @comment.destroy
  
      redirect_to category_path, status: :see_other
    end
  
    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type, :type)
    end
  end
  