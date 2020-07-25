class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    # バリデーションエラー時に 記事詳細にリダイレクトする
    @post.comments.create(comment_params)
    redirect_to posts_path(@post)
  end

  def destroy
    # 記事の特定
    @post = Post.find(params[:post_id])
    # comment の特定 find
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
