class CreatePostBodies < ActiveRecord::Migration[6.1]
  def change
    create_table :post_bodies do |t|
      t.references  :post, null: false, foreign_key: true
      t.text        :text
      t.string      :image_title
      t.binary      :image_body

      t.timestamps
    end
  end
end
