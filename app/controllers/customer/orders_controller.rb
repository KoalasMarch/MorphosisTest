class Customer::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  def index
    @orders = Order.all
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    return render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity unless @order.save

    render status: :create
  end

  def update
    return render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity unless @order.update(order_params)
  end

  def destroy
    return render json: { errors: @order.errors.full_messages } unless @order.destroy

    render status: :no_content
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end


    def order_params
      params.require(:order).permit(:first_name, :last_name, :address, :district, :sub_district, :province, :zip_code, :total_price, :status)
    end
end
