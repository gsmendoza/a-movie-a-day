Movieaday::Application.routes.draw do
  resources :recommendations, only: [:index]
end
