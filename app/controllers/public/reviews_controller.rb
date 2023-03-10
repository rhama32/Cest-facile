class Public::ReviewsController < ApplicationController

  before_action :authenticate_customer!
  before_action :ensure_customer, only: [:edit]
  
  def new
    @hospital = Hospital.find(params[:hospital_id])
    @review = @hospital.reviews.build
  end

  def confirm
  end

  def create
    @review = current_customer.reviews.build(review_params)
    @hospital = @review.hospital
    @review.customer_id = current_customer.id
    if params[:post]
      @review.update(is_draft: false)
    if @review.save
      flash[:notice] = "レビュー投稿が完了しました。"
      redirect_to public_reviews_path
    else
      flash.now[:alert] = "レビュー投稿に失敗しました。"
      render 'new'
    end
  #下書きボタンを押した時
    else
      @review.update(is_draft: true)
    if @review.save!(validate: false)
      flash[:notice] = "レビューの下書きを保存しました。"
      redirect_to edit_public_review_path(@review.id)
    else
      render :new, alert: "下書きの保存に失敗しました。"
    end
    end
  end
 
  def update
    @review = Review.find(params[:id])
      # ①下書きレビューの更新（公開）の場合
    if params[:publicize_draft]
    # レビュー公開時にバリデーションを実施
    # updateメソッドにはcontextが使用できないため、公開処理にはattributesとsaveメソッドを使用する
      @review.attributes = review_params.merge(is_draft: false)
    if @review.save
      redirect_to public_reviews_path(@review.id), notice: "下書きをレビュー公開しました。"
    else
      @review.is_draft = true
      render :edit, alert: "下書きを公開できませんでした。"
    end
    # ②公開済みレビューの更新の場合
    elsif params[:update_post]
      @review.attributes = review_params
    if @review.save
      redirect_to public_reviews_path(@review.id), notice: "公開済みのレビューを更新しました。"
    else
      render :edit, alert: "公開済みレビューを編集できませんでした。"
    end
    # ③下書きレビューの更新（非公開）の場合
    else
    if @review.update(review_params)
      redirect_to public_reviews_path(@review.id), notice: "下書きレビューを更新しました。"
    else
      render :edit, alert: "更新できませんでした。"
    end
    end
  end

  def index
    @hospital = Hospital.all
    @reviews = current_customer.reviews.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @review = Review.find(params[:id])
    @customer = @review.customer
    @replies = @review.replies
    @reply = Reply.new(review_id: @review.id)
  end
 
  def hospital_reviews
    @hospital = Hospital.find(params[:hospital_id])
    @reviews = @hospital.reviews.order(created_at: :desc).page(params[:page]).per(6)
  end

  def edit
  
  end
 
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to public_reviews_path, notice: "レビューを削除しました。"
    end
  end
 
  def comment_destroy
    @review = Review.find(params[:review_id])
    @reply = current_customer.replies.build(reply_params)
    @reply.destroy
    @reply = Reply.new
  end

 private
  def review_params
    params.require(:review).permit(:customer_id, :hospital_id, :doctor_satisfaction, :room_clean, :staff_satisfaction, :waiting_time, :comment, :total_point)
  end

  def ensure_customer
    @review = Review.find(params[:id])
    unless @review.customer == current_customer
      redirect_to root_path(current_customer) , notice: '他ユーザーのレビュー編集画面へは遷移出来ません。'
    end
  end

end