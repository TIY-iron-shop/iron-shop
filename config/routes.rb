Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :new, :create, :update, :show] do
    member do
      post :price_watch
    end
  end

  scope '/cart' do
    get "/" => "carts#show_cart", :as => "cart"
    get "/data" => "carts#data"
    post "/add-cart/:id" => "carts#add_cart", :as => "add_cart"
    delete "/remove-cart/:id" => "carts#remove_cart"
  end

end
