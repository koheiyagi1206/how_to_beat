class PostBody < ApplicationRecord

  has_one_attached :image_body
  belongs_to :post

  validate :x_and_y_must_be_present_together

  private
    def x_and_y_must_be_present_together
      if image_title.present? && image_body.blank?
        errors.add(:image_body, "を入力してください")
      elsif image_body.present? && image_title.blank?
        errors.add(:image_title, "を入力してください")
      end
    end
end
