# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# デバッグ値：管理者ログイン
Admin.create!(
  email:    "admin@mail.com",
  password: "123456"
)

# デバッグ値：ユーザーログイン
User.create!(
  user_name:  "user_1",
  email:      "user_1@mail.com",
  password:   "123456"
)
User.create!(
  user_name:  "user_2",
  email:      "user_2@mail.com",
  password:   "123456"
)

# デバッグ値：投稿
Post.create!(
  user_id:  1,
  title:    "game no stage1-1. "
)
PostBody.create!(
  post_id:  1,
  text:     "this stage is very easy!"
)
PostBody.create!(
  post_id:  1,
  text:     "this stage is very hard!"
)


# デバッグ値：コメント
Comment.create!(
  post_id: 1,
  user_id: 2,
  comment: "comment for post_id:1."
)
