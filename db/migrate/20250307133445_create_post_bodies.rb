class CreatePostBodies < ActiveRecord::Migration[6.1]
  def change
    create_table :post_bodies do |t|
      t.integer   :post_id,     null: false, foreign_key: true
      t.text      :text,        default: ""
      t.string    :image_title, default: ""
      t.binary    :image_body,  default: ""

      t.timestamps
    end
  end
end
