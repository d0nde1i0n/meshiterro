Rails.application.routes.draw do

  devise_for :users #deviceをしようする際にURLとして、usersを含むことを示す
  root to: "homes#top" # ルートパスをtopアクションと紐付け
  get "homes/about" => "homes#about",as: "about"
  #resourcesコマンドで自動生成するルーティングをonlyオプションで制限
  resources :post_images,only:[:new,:create,:index,:show,:destroy]
  resources :users,only:[:show,:edit]

end