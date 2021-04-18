class Customer::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  def index
    @orders = Order.all

    render json: @orders.as_json
  end

  def show
    render json: @order.as_json
  end

  def create
    @order = Order.new(order_params)
    results = @order.create_order_products(params[:details])

    return render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity unless @order.save

    PaymentJob.perform_async(order_id: @order.id)
    render json: { order: @order, products: @order.products, results: results }, status: :created
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
      params.require(:order).permit(:first_name, :last_name, :address, :district, :sub_district, :province, :zip_code)
    end
end
