class PostComposer < ApplicationRecord
  belongs_to :composer
  belongs_to :post
end
