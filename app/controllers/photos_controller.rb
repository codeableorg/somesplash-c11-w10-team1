class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order(name: :asc)
  end

  def show
    @category = Category.find(params[:id])
    @photos = @category.photos
    
  end
  def new
    @photo = Photo.new
    @category = Category.find(params[:category_id])
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
  
  # /search?query=alva
  # def search
  #   query = params[:query]
  #   @photos = Photo.where(" LOWER(name) LIKE ?","%#{query.downcase}%")
  # end
  
  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image, :category_id)
  end
end