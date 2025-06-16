Rails.application.routes.draw do
  root "home#index"
end
Rails.application.routes.draw do
  get "home/place", to: "home#place", as: :place_home
end
