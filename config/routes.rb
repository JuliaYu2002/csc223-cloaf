Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'home/howitworks'
  get 'home/map'
  get 'home/pricing'
  get 'home/about'
  get 'home/help'
  get 'home/privacy'
  get 'home/terms_of_use'
  get 'home/my_account'
  get 'home/rent'
end
