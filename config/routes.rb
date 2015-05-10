Rails.application.routes.draw do
  get 'articles/bargains' => 'articles#bargains', :as => "bargain_articles"
  get 'articles/unrecognized' => 'articles#unrecognized', :as => "unrecognized_articles"
  get 'articles/trending' => 'articles#trending', :as => "trending_articles"
  get 'articles/search' => 'articles#search', :as => "search_articles"
  get 'articles/wishlist' => 'articles#wishlist', :as => "wishlist"
  get 'articles/batch_destroy' => 'articles#batch_destroy', :as => "batch_destroy"

  resources :articles

  devise_for :users, :controllers => { sessions: 'users/sessions' }

  devise_scope :user do
    authenticated :user do
      root :to => 'articles#index'
    end

    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
