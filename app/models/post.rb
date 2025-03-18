class Post < ApplicationRecord
  require 'mini_magick'

  has_one_attached :post_image

  belongs_to :user

  has_many :post_bodies,  dependent: :destroy
  has_many :comments,     dependent: :destroy

  accepts_nested_attributes_for :post_bodies, allow_destroy: true, reject_if: :all_blank

  def get_post_image
    unless post_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      post_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpg")
    end
    post_image.variant(gravity: :center, resize:"660x438^", crop:"660x438+0+0", background:"white").processed
  end
end
