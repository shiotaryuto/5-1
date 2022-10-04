class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       redirect_to public_customer_path(:id)
    # else
    #   @customer = Customer.all
    #   render :edit
    end

  end

  def unsubscribe

  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to public_top_path
  end

private
def customer_params
  params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :telephone_number, :email, :address)
end
end
