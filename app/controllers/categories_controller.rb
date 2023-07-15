class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @categories = Category.new
  end

  def show
    @categories = Category.find(params[:id])
    @photos = @categories.photos
  end

  def create
    @categories = Category.new(category_params)
    if @categories.save
      redirect_to categories_path 
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def update
    @categories = Category.find(params[:id])
    
    if @categories.update(category_params)
      redirect_to categories_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @categories = Category.find(params[:id])
    @categories.destroy
    
    redirect_to categories_path, status: :see_other
  end
  
  private

  def category_params
    params.require(:category).permit(:name, :description, :cover)
  end
end
