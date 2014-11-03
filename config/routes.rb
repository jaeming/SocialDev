Bloccit::Application.routes.draw do

  get "comments/create"
  devise_for :users
  resources :users, only: [:update, :show, :index]

  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts'
    # resources :posts do
    #   resources :comments, only: [:create]
  end

  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]

      post '/up-vote' => 'votes#up_vote', as: :up_vote
      post '/down-vote' => 'votes#down_vote', as: :down_vote
  end


  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
