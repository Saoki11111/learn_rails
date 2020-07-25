class Comment < ApplicationRecord
  # rails g model Comment body:string post:references
  # post:references により post model と紐づく
  belongs_to :post
  # body を必須
  validates :body, presence: true
end
