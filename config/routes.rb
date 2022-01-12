Rails.application.routes.draw do
  root to: "homes#top" # ルートパスをtopアクションと紐付け
  devise_for :users #deviceをしようする際にURLとして、usersを含むことを示す

  #resourcesコマンドで自動生成するルーティングをonlyオプションで制限
  resources :post_images,only:[:new,:create,:index,:show,:destroy]

  get "homes/about" => "homes#about",as: "about"

end