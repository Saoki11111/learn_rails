class PostsController < ApplicationController

  # Convention over Configuration(CoC)
  # 単数形、複数形などの規約を決めることでコードを書く量を減らす

  def index
    @posts = Post.all.order(created_at: 'desc')
  end

  def show
    @post = Post.find(params[:id])
  end
end
