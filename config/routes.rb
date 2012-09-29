Movieaday::Application.routes.draw do
  resource :recommendation, only: [:show]
end
