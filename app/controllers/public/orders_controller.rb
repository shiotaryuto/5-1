class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to public_thanks_path
    end

    # 注文詳細テーブルを作るきじゅつがひつよう！
    # current_customer.cart_itemsからとりだして商品詳細テーブルを作成する。
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      #  item_id: nil, order_id: nil, purchase_price: nil, amount: nil, making_status: nil　この値をいれてsaveをかける
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.purchase_price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.making_status = 0
      @order_detail.save!
    end
    current_customer.cart_items.destroy_all
  end

  def index
    @orders = Order.all

  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    @order.postage = 800
    if params[:order][:address_select] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_select] == "1"

    @address = Address.find(params[:order][:address_id])

    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    elsif params[:order][:address_select] == "2"
    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :billing_amount, :payment_method, :status)
  end
end
