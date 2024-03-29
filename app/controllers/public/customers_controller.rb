class Public::CustomersController < ApplicationController
  
  #会員、ゲストユーザではない場合、ログイン画面へ遷移。
  before_action :authenticate_customer!
  before_action :ensure_guest_user, only: [:edit]
  
  #顧客詳細
  def show
    @customer = current_customer
  end
　
　#顧客編集
  def edit
    @customer = current_customer
  end

　#顧客編集→アップデート
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to customers_mypage_path
    else
      flash[:alert] = "編集に失敗しました。"
      render 'edit'
    end
  end

  def unsubscribe
    @customer = current_customer
  end

　#顧客退会
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
　
　#ストロングパラメータ
  private
    def customer_params
      params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
    end

　#ゲストユーザーの制限
  def ensure_guest_user
    @customer = current_customer
    if @customer.guest_user?
      redirect_to root_path(current_customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end