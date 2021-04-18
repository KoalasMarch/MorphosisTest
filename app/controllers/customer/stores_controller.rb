class Customer::StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]

  def index
    @stores = Store.all

    render json: @stores.as_json
  end

  def show
    render json: { store: @store.as_json, products: @store.region.products } 
  end

  private

    def set_store
      @store = Store.find(params[:id])
    end


    def store_params
      params.require(:store).permit(:name)
    end
end
