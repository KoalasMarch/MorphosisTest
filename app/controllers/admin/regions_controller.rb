class Admin::RegionsController < Admin::BaseController
  before_action :set_region, only: %i[ show update destroy ]

  def index
    @regions = Region.all
  end

  def show
  end

  def create
    @region = Region.new(region_params)
    return render json: { errors: @region.errors.full_messages } unless @region.save

    render status: :create
  end

  def update
    return render json: { errors: @region.errors.full_message } unless @region.update(region_params)
  end

  def destroy
    return render json: { errors: @region.errors.full_messages } unless @region.destroy

    render status: :no_content
  end

  private
    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:title, :country_details, :currency_details, :tax_details, :store_id)
    end
end
