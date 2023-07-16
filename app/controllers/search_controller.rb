class SearchController < ApplicationController
    def search
        @category = Photo.all
    end
    def result
        @keyword = params[:query]
        @photos = Photo.where("LOWER(title) LIKE ?", "%#{@keyword.downcase}%")
    end
end
