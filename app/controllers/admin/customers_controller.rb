class Admin::CustomersController < ApplicationController

#管理者でログインしていない場合、ログイン画面へ遷移。
before_action :authenticate_admin!

#顧客一覧画面
def index
 @admin_customers = Customer.all.page(params[:page]).per(10)
end

#顧客詳細画面
def show
 @admin_customer = Customer.find(params[:id])
end

#顧客編集画面を表示
def edit
 @admin_customer = Customer.find(params[:id])
end

#顧客編集画面から情報を更新した場合
 def update
  @admin_customer = Customer.find(params[:id])
  if @admin_customer.update(admin_customer_params)
   flash[:notice] = "情報の変更が完了しました."
   redirect_to admin_customer_path
  else
   flash[:alret] = "変更の保存に失敗しました"
   render :edit
  end
 end

 private
  def admin_customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end