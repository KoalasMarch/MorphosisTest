class Customer::OrderProductsController < ApplicationController
  before_action :set_order_product, only: %i[ show update destroy ]

  def index
    @order_products = OrderProduct.all

    render json: @order_products.as_json
  end

  def show
    render json: @order_product.as_json
  end

  def create
    @order_product = OrderProduct.new(order_product_params)
    return render json: { errors: @order_product.errors.full_messages } unless @order_product.save

    render status: :create
  end

  def update
    return render json: { errors: @order_product.errors.full_message } unnless @order_product.update(order_product_params)
  end

  def destroy
    return render json: { errors: @order_product.errors.full_messages } unless @order_product.destroy

    render status: :no_content
  end

  private

    def set_order_product
      @order_product = OrderProduct.find(params[:id])
    end


    def order_product_params
      params.require(:order_product).permit(:order_id, :product_id)
    end
end
