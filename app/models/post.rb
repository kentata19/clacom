class Post < ApplicationRecord
  #アソシエーション関係
  belongs_to :user
  has_one_attached :thumbnail
  has_many :post_composers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :user_posts, dependent: :destroy

  #アクションテキスト関係
  has_rich_text :caption
  has_rich_text :circumstance
  has_rich_text :configuration
  has_rich_text :organization
  has_rich_text :column
  has_rich_text :quotation
  #バリデーション関係
  validates :category, :acceptance =>true
  validates :thumbnail, presence: true
end
