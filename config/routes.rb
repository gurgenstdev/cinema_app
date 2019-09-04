Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources "theaters" do
    resources "theater_movies"
  end
  resources "movies"
  resources "auditoriums"
end
