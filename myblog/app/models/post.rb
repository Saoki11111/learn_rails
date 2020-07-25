class Post < ApplicationRecord
  # comment と紐づく
  # @post.comments ができる
  # dependent: :destroy で 記事を消すと コメントも消えるようにする
  has_many :comments, dependent: :destroy
  # title に 文字数制限 message->rails のエラーメッセージをカスタマイズ
  validates :title, presence: true, length: { minimum: 3, message: 'Too short to post!' } 
  # 空のときは必須
  validates :body, presence: true
end
