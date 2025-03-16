class PostBody < ApplicationRecord
  has_one_attached :image_body
  belongs_to :post
end
