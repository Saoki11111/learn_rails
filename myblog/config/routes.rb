Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    # 記事に紐付かせる
    resources :comments, only:[:create, :destroy]
  end

  # root = / では posts コントローラーの index アクション(メソッド)を呼ぶ
  root 'posts#index'
end
