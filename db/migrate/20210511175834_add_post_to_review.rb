class AddPostToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :post, foreign_key: true
  end
end
