class PagesController < ApplicationController
  def index
		@categories = Category.roots.order("position asc")
  	@category = Category.find_by(url: params[:page])
  	if params[:sub_page]
  		@articles = Category.find_by(url: params[:sub_page]).articles
  	else
  		@articles = @category.articles 
	  	@category.children.each do |x|
	  		@articles += x.articles
	  	end
	  end
  end
end
