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

# デバッグ値：user_1投稿
Post.create!(
  user_id:  1,
  title:    "game no stage1-1. "
)
Post.create!(
  user_id:  2,
  title:    "game no stage2-1. "
)
Post.create!(
  user_id:  1,
  title:    "game no stage3-1. "
)
Post.create!(
  user_id:  1,
  title:    "game no stage4-1. "
)
Post.create!(
  user_id:  1,
  title:    "game no stage5-1. "
)

# デバッグ値：post_id:1に対するコメント
Comment.create!(
  post_id: 1,
  user_id: 2,
  comment: "comment. comment. comment. comment. comment. comment."
)
Comment.create!(
  post_id: 2,
  user_id: 2,
  comment: "comment. comment. comment. comment. comment. comment."
)
Comment.create!(
  post_id: 2,
  user_id: 2,
  comment: "comment. comment. comment. comment. comment. comment."
)
Comment.create!(
  post_id: 2,
  user_id: 2,
  comment: "comment. comment. comment. comment. comment. comment."
)
Comment.create!(
  post_id: 3,
  user_id: 2,
  comment: "comment. comment. comment. comment. comment. comment."
)
Comment.create!(
  post_id: 3,
  user_id: 2,
  comment: "comment. comment. comment. comment. comment. comment."
)
Comment.create!(
  post_id: 4,
  user_id: 2,
  comment: "comment. comment. comment. comment. comment. comment."
)
Comment.create!(
  post_id: 4,
  user_id: 2,
  comment: "comment. comment. comment. comment. comment. comment."
)
Comment.create!(
  post_id: 4,
  user_id: 2,
  comment: "comment. comment. comment. comment. comment. comment."
)
Comment.create!(
  post_id: 4,
  user_id: 2,
  comment: "comment. comment. comment. comment. comment. comment."
)
