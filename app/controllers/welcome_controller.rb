class WelcomeController < ApplicationController
  def index
  	@categories = Category.roots.order("position asc")
  	@articles = Article.all
  	@banners = Banner.where(status: 1).order("position": "asc")
  end
end
