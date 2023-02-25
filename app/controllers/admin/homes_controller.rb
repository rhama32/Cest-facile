class Admin::HomesController < ApplicationController

  #管理者でログインしていない場合、ログイン画面へ遷移。
  before_action :authenticate_admin!
  
  def top
    @admin = Customer.all.page(params[:page])
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
end