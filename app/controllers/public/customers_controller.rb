class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_user, only: [:edit]
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_mypage_path
    else
      render 'edit'
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def add_doctor
    @doctor = Doctor.find(params[:hospital_doctor_id])
    customer = Customer.find(params[:customer_id])
    @doctor.customers << customer
    redirect_to root_path, notice: "ドクターを追加しました。"
  end

  private
    def customer_params
       params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
    end

  def ensure_guest_user
    @customer = current_customer
    if @customer.last_name == "guestuser"
      redirect_to root_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end