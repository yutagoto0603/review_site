class TopController < ReviewController

  before_action :authenticate_user! ,:except => [:index]

  def index
    @products = Product.order('id ASC').limit(20) # productテーブルから最新順に作品データを20件取り出す
  end

  def search
    # productsテーブルからキーワードで検索した作品データを20件取り出し、@products変数に入れる処理を書いて下さい
    @products = Product.where('title LIKE(?)', "%#{search_params[:keyword]}%").limit(20)
  
  end

  def entry
    @product = Product.find(entry_params[:id])
  end

  def post
    # top_controller.rbのpostアクションでデータを受け取り、データベースに保存する処理を書いて下さい
    # トップページにリダイレクトする処理を書いて下さい
    Review.create(product_id: create_params[:product_id], user_id: current_user.id ,rate: create_params[:rate], review:create_params[:review])

    redirect_to action: :index

  end

  private
  def search_params
    params.permit(:keyword)
  end

  def entry_params
    params.permit(:id)
  end

  def create_params
    params.permit(:product_id, :nickname ,:rate, :review)
  end

  def authenticate_user!
    redirect_to '/users/sign_in' unless user_signed_in?
  end
  
end
