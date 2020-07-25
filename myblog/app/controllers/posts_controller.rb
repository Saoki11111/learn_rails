class PostsController < ApplicationController

  # Convention over Configuration(CoC)
  # 単数形、複数形などの規約を決めることでコードを書く量を減らす

  def index
    @posts = Post.all.order(created_at: 'desc')
  end

  def show
    # comment も取れる
    @post = Post.find(params[:id])
  end

  def new
    # view で @post を使っているが Controller で @post が new の方に無い
    # 空のオブジェクトを作る
    @post = Post.new
  end

  def create
    # .inspect で値を確認できる
    # render plain: params[:post].inspect
    
    # save
    # @post = Post.new(params[:post]) # データ取得
    # private method post_params を呼ぶ
    @post = Post.new(post_params)

    # 保存が失敗したとき
    if @post.save
      # redirect
      redirect_to posts_path # 記事一覧は posts_path
    else
      # エラーメッセージ
      # render plain: @post.errors.inspect
      # エラー時に new と同じフォームを表示
      render 'new'
    end
  end

  def edit
    # 個々のデータ
    @post = Post.find(params[:id])
  end

  def update
    # post を取得
    @post = Post.find(params[:id])
    if @post.update(post_params)
      # うまく行ったら 記事の一覧へリダイレクト
      redirect_to posts_path
    else
      # 失敗したら edit(そのまま) を表示するk
      render 'edit'
    end
  end

  def destroy
    # URL のアクセスを明示的にする
    # 記事の特定
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    # 悪意あるデータの挿入を防ぐ
    # post を key にして title と body のあるハッシュのみを受けつける
    params.require(:post).permit(:title, :body)
  end
end
