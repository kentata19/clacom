class Review < ApplicationRecord
  has_rich_text :caption
  belongs_to :user
  belongs_to :post
end
