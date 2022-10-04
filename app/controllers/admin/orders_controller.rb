class Admin::OrdersController < ApplicationController
  def show

     @order = Order.find(params[:id])
     @order_details = OrderDetail.all
  end
   private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :billing_amount, :payment_method, :status)
  end
end
