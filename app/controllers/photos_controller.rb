class PhotosController < ApplicationController
  
  def new
    @photo = Photo.new
    @category = Category.find(params[:category_id])
  end
  
  def show
    @photo = Photo.find(params[:id])
    @category = @photo.category
    @comments = @photo.comments
  end

  def edit
    @photo = Photo.find(params[:id])
    @category = @photo.category
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to category_path(@photo.category)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to category_path(@photo.category)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    
    redirect_to category_path(@photo.category), status: :see_other
  end

  # /search?query=alva
  def search
    @query = params[:query]
    @photos = Photo.where(" LOWER(name) LIKE ?","%#{query.downcase}%")
  end
  
  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image, :category_id)
  end
end