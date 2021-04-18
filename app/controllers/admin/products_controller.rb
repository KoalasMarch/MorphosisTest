class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: %i[ show update destroy ]

  def index
    @products = Product.all

    render json: @products.as_json
  end

  def show
    render json: @product.as_json

  end

  def create
    @product = Product.new(product_params)
    @product.image.attach(params[:product][:image]) if params[:product][:image].present?
    Stock.new(product: @product, stock_number: params[:stock_number]) if params[:stock_number].present?
    return render json: { errors: @product.errors.full_messages } unless @product.save

    render json: { product: @product.as_json, image: @product.image_url }, status: :created
  end

  def update
    @product.image.attach(params[:product][:image]) if params[:product][:image].present?
    return render json: { errors: @product.errors.full_message } unless @product.update(product_params)
    render json: { product: @product.as_json, image: @product.image_url }
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
      params.require(:product).permit(:title, :description, :price, :sku, :image)
    end
end
