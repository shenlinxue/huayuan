Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :admin do 
  	root 'categories#index'
  	resources :sessions
  	resources :categories do 
  		member do 
        get 'set_order'
  			#每个路由一个动作
        #get 'set_up'
  		end
  	end
  	resources :articles



  end

 

end
