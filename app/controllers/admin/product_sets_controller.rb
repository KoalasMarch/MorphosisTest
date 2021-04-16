class ProductSetsController < ApplicationController
  before_action :set_product_set, only: %i[ show edit update destroy ]

  # GET /product_sets or /product_sets.json
  def index
    @product_sets = ProductSet.all
  end

  # GET /product_sets/1 or /product_sets/1.json
  def show
  end

  # GET /product_sets/new
  def new
    @product_set = ProductSet.new
  end

  # GET /product_sets/1/edit
  def edit
  end

  # POST /product_sets or /product_sets.json
  def create
    @product_set = ProductSet.new(product_set_params)

    respond_to do |format|
      if @product_set.save
        format.html { redirect_to @product_set, notice: "Product set was successfully created." }
        format.json { render :show, status: :created, location: @product_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_sets/1 or /product_sets/1.json
  def update
    respond_to do |format|
      if @product_set.update(product_set_params)
        format.html { redirect_to @product_set, notice: "Product set was successfully updated." }
        format.json { render :show, status: :ok, location: @product_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sets/1 or /product_sets/1.json
  def destroy
    @product_set.destroy
    respond_to do |format|
      format.html { redirect_to product_sets_url, notice: "Product set was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_set
      @product_set = ProductSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_set_params
      params.require(:product_set).permit(:product_id, :region_id)
    end
end
