class Customer::StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]

  def index
    @stores = Store.all
  end

  def show
  end

  private

    def set_store
      @store = Store.find(params[:id])
    end


    def store_params
      params.require(:store).permit(:name)
    end
end