class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references  :post,    null: false
      t.references  :user,    null: false
      t.text        :comment, null: false
      t.decimal     :score, precision: 5, scale: 3

      t.timestamps
    end
  end
end
