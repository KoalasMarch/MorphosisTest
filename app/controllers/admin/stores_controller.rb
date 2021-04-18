class Admin::StoresController < Admin::BaseController
  before_action :set_store, only: %i[ show update destroy ]

  def index
    @stores = Store.all

    render json: @stores.as_json
  end

  def show
    render json: @store.as_json
  end

  def create
    @store = Store.new(store_params)
    return render json: { errors: @store.errors.full_messages } unless @store.save

    render status: :create
  end

  def update
    return render json: { errors: @store.errors.full_message } unless @store.update(store_params)
  end

  def destroy
    return render json: { errors: @store.errors.full_messages } unless @store.destroy

    render status: :no_content
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name)
    end
end
