Rails.application.routes.draw do
  get 'articles/bargains' => 'articles#bargains', :as => "bargain_articles"

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