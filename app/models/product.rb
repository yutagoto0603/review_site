class Product < ActiveRecord::Base
  has_many :reviews

  def review_average
    review_judge = reviews.select(:rate).average(:rate)
    #ifを使ってnil判定
    if review_judge != nil
      review_judge.round
    end
  end
end

# 平均評価を求めるメソッド
