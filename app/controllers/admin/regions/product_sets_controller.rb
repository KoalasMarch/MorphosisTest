class Admin::Regions::ProductSetsController < Admin::BaseController
  before_action :set_region
  before_action :set_product_set, only: %i[ show update destroy ]

  def index
    @product_sets = @region.product_sets
  end

  def show
  end

  def create
    @product_set = ProductSet.new(product_set_params)
    @product_set.region_id = @region.id
    return render json: { errors: @product_set.errors.full_messages } unless @product_set.save

    render status: :create
  end

  def update
    return render json: { errors: @product_set.errors.full_message } unless @product_set.update(product_set_params)
  end

  def destroy
    return render json: { errors: @product_set.errors.full_messages } unless @product_set.destroy

    render status: :no_content
  end

  private
    def set_region
      @region = Region.find(params[:region_id])
    end

    def set_product_set
      @product_set = @region.product_sets.find(params[:id])
    end

    def product_set_params
      params.require(:product_set).permit(:product_id)
    end
end
