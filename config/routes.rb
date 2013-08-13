Storehouse::Application.routes.draw do

  resources :blobs

  resources :export_records
  resources :export_runs
  resources :data_sources

  namespace :api do
    api :version => 1 do
      resources :data_sources
      resources :export_runs
      resources :export_records
    end
  end

  authenticated :user do
    root :to => 'data_sources#index'
  end

  root :to => 'data_sources#index'

#  devise_for :users do
#    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
#  end
  devise_for :users

  resources :users do
    # This will create URLs like /my_resources/page/33 instead of /my_resources?page=33. This is now a friendly URL, but it also has other added benefits…
    get 'page/:page', :action => :index, :on => :collection
  end

end
