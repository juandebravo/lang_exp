LangExp::Application.routes.draw do
  
  #resources :walls

  #resources :feeds do
    #member do
      # post 'comment'
    #end
  #end
  
  post "/feeds/:id/comment", :controller => "feeds", :action => "comment", :as => :comment_feed
  
  post "/snippet/:id/comment", :controller => "users", :action => "snippet_comment", :as => :comment_snippet

  get "home/index"

  get "home/about"

  devise_for :users

  resources :users do
    get 'feed', :controller => "walls", :action => "index", :as => :feed
    
    get 'wall', :controller => "walls", :action => "show", :as => :wall
    
    get 'snippets'
    #resources :wall, :controller => "walls"
    #member do
    #  get 'wall', :controller => "walls", :action => "index", :as => :user_wall_index
    #end
    
    resources :profile, :controller => "profiles"
    
    post 'friends/:id', :action => "add_friend", :as => :add_friend
    delete 'friends/:id', :action => "delete_friend", :as => :delete_friend
  end

  resources :profiles

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
