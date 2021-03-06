Rails.application.routes.draw do
  mount_devise_token_auth_for 'Player', at: 'auth'
  resources :rounds
  resources :teams
  resources :championships
  resources :bets
  resources :bet_leagues
  resources :players
  resources :player_bet_leagues
  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
