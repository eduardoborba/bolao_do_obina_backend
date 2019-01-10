Rails.application.routes.draw do
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
