class WelcomeController < ApplicationController
  def index
  	@categories = Category.roots.order("position asc")
  	@articles = Article.all
  end
end
