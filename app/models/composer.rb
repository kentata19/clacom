class Composer < ApplicationRecord
  
  has_one_attached :profile_photo
  has_rich_text  :information
  has_many :post_composers
  validates :profile_photo, presence: true
end
