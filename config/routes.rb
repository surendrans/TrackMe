TrackMe::Application.routes.draw do
  resources :user_request_details do
  collection do
  get "search_users"
  get "send_user_request"
  end
  end

  devise_for :users

  resources :waypoints

  resources :trips

		match "/users/watching_me" => "trips#watching_users"
		match "/users/iam_watching" => "trips#iam_watching" 
		match "/users/notifications" => "trips#notifications" 
		match "/users/req_handle"    => "trips#request_handle"
 scope 'api' do
    scope 'v1' do
     post 'create_trip' => "api/v1/trips#create"
     post 'create_waypoint' => "api/v1/waypoints#create"
     post 'update_trip_status' => 'api/v1/trips#update_status'
    end
 end
 
 scope 'api' do
    scope 'v1' do
      get 'get_authentication_token' => "api/v1/sessions#get_authentication_token"
      get 'get_issues_for_mapping_posted_by_me' => "api/v1/issues#get_issues_for_mapping_posted_by_me"
      get 'share_an_issue' => "api/v1/issues#share_an_issue_get"
      post 'share_an_issue' => "api/v1/issues#share_an_issue"
      post 'signup' => "api/v1/sessions#create_user"
      get "get_issue/:id" => "api/v1/issues#get_issue"
      get "get_recent_issues" => "api/v1/issues#get_recent_issues"
      get "set_geolocation_for_issue" => "api/v1/issues#set_geolocation_for_issue"
      get "set_geolocation_for_issue" => "api/v1/issues#set_geolocation_for_issue"
    end
  end

  resources :locations do
 	 collection do
  		get :create_location_api
  		post :create_location_api
 	 end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "trips#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
