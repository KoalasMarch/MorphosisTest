class Admin::RegionsController < Admin::BaseController
  before_action :set_region, only: %i[ show update destroy create_product_sets ]

  def index
    @regions = Region.all

    render json: @regions.as_json
  end

  def show
    render json: @region.as_json
  end

  def create
    @region = Region.new(region_params)
    return render json: { errors: @region.errors.full_messages } unless @region.save

    render status: :created
  end

  def update
    return render json: { errors: @region.errors.full_message } unless @region.update(region_params)

    render json: @region.as_json
  end

  def destroy
    return render json: { errors: @region.errors.full_messages } unless @region.destroy

    render json: { message: 'Region was successfully destroyed' }
  end

  def create_product_sets
    @region.create_product_sets(params[product_ids])

    render json: { region: @region, products: @region.products }
  end

  private
    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:title, :country_details, :currency_details, :tax_details, :store_id)
    end
end
