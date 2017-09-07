class WelcomeController < ApplicationController
  def index
  	@categories = Category.roots.order("weight": "desc")
  end
end
