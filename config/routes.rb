Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top" # ルートパスをtopアクションと紐付け
  get "homes/about" => "homes#about",as: "about"
end