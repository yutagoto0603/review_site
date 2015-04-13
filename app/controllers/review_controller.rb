class ReviewController < ApplicationController
  before_action :ranking
  layout 'review_site'

  def ranking
    #Reviewsテーブルのレコードをproduct_idごとにまとめて、数の多い5件を取得する
    ids = Review.group(:product_id).order('count_product_id DESC').count(:product_id).keys
    @ranking = ids.map {|product_id| Product.find_by(:id => product_id)}
  end


end
