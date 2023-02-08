class Admin::HomesController < ApplicationController

 before_action :authenticate_admin!

  def top
  @admin = Customer.all.page(params[:page])
  end

  private
	def order_params
	 params.require(:order).permit(:status)
	end
end