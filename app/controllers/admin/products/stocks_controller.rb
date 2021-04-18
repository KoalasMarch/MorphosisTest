class Admin::Products::StocksController < Admin::BaseController
  before_action :set_product
  before_action :set_stock, only: %i[ create update ]

  def create
    @stock = Stock.new(stock_params)
    return render json: { errors: @stock.errors.full_messages } unless @stock.save

    render status: :created
  end

  def update
    return render json: { errors: @stock.errors.full_messages } unless @stock.update(stock_params)
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_stock
      @stock = @product.stock.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:stock_number, :product_id)
    end
end
