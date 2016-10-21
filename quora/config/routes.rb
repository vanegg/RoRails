Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :questions do
      resources :answers
    end
  end
  # get "/pages/*page" => "pages#show"
  # root "pages#show", page: "home"

  get "/pages/home" => "pages#home"
  get "/pages/login" => "pages#login"
  post "/pages/login" => "pages#val_login"
  get "/pages/about" => "pages#about"
  get "/pages/logout" => "pages#logout"
  root "pages#home" 

  get "/questions/all" => "questions#all"
end
