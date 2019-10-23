Rails.application.routes.draw do
  root "home#index"

  get '/auth/slack/sign-in', to: 'sessions#new'
  get '/auth/slack/callback', to: 'sessions#create'
  get '/auth/slack/sign_out', to: 'sessions#destroy'
end
