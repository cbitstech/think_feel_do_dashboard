ThinkFeelDoDashboard::Engine.routes.draw do
  root to: "admin#index"
  resources :arms
  resources :groups
  resources :moderators, only: [:destroy]
  resources :participants do
    resources :coaches, controller: :coach_assignments, except: [:index]
    resources :groups, controller: :memberships, except: [:index]
  end
  resources :reports
  resources :users
end