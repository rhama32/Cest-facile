class Public::FavoritesController < ApplicationController

  #顧客ログインしていない時はログイン画面へ
  before_action :authenticate_customer!
  
  #いいね機能
  def create
    @review = Review.find(params[:review_id])
    favorite = current_customer.favorites.new(review_id: @review.id)
    favorite.save
  end
　
　#いいね削除
  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_customer.favorites.find_by(review_id: @review.id)
    favorite.destroy
  end

end