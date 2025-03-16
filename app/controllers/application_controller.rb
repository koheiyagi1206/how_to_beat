class ApplicationController < ActionController::Base
  $new_arrivals_comments  = Comment.order(updated_at: :desc).includes(:user, :post)

  # コメント数の多い順で記事を抽出
  def comment_many_order_sort
    comment_counts        = Comment.group(:post_id).count
    sorted_comment_counts = comment_counts.sort_by { |key, value| value }.reverse.to_h

    # 検索用の配列を作成
    array_target_search = []
    sorted_comment_counts.each do |key, value|
      array_target_search << key
    end

    # コメント数の多い順にソート
    $sorted_post = Post.select(:id, :title).where(id: array_target_search).index_by(&:id).values_at(*array_target_search)

  end

end
