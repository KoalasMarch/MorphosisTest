class Admin::StocksController < Admin::BaseController
  before_action :set_stock, only: %i[ show update destroy ]

  def index
    @stocks = Stock.all
  end

  def show
  end

  def create
    @stock = Stock.new(stock_params)
    return render json: { errors: @stock.errors.full_messages } unless @stock.save

    render status: :create
  end

  def update
    return render json: { errors: @stock.errors.full_messages } unless @stock.update(stock_params)
  end

  def destroy
    return render json: { errors: @stock.errors.full_messages } unless @stock.destroy

    render status: :no_content
  end

  private
    def set_stock
      @stock = Stock.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:stock_number, :product_id)
    end
end
