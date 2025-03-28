class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references  :post,    null: false
      t.references  :user,    null: false
      t.text        :comment, null: false

      t.timestamps
    end
  end
end
