Tuolumne::Application.routes.draw do
  resources :people

  resources :companies

  match "companies/parse/:id" => "companies#parse"
  match "update_people" => "people#update_people"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
