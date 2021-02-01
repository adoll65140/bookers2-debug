Rails.application.routes.draw do
  devise_for :users
  #3 順番入れ替え　devise_for :users　を上に
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  root 'homes#top'
  get 'home/about' => 'homes#about'
end
#1 end追記