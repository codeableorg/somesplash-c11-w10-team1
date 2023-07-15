class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:new, :edit, :create]

  def show
    @comments = @photo.comments
    @comment = @photo.comments.new
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to category_path(@photo.category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to category_path(@photo.category)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @photo.destroy
    redirect_to category_path(@photo.category), status: :see_other
  end

  def init_search
    @photo = Photo.new
  end

  def search
    @query = params[:query].downcase
    @photos = Photo.where("LOWER(title) LIKE ?", "%#{@query}%")
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :category_id, :cover)
  end
end