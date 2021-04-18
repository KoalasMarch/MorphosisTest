class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: %i[ show update destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    return render json: { errors: @product.errors.full_messages } unless @product.save

    render status: :create
  end

  def update
    return render json: { errors: @product.errors.full_message } unless @product.update(product_params)
  end

  def destroy
    return render json: { errors: @product.errors.full_messages } unless @product.destroy

    render status: :no_content
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :price, :sku)
    end
end