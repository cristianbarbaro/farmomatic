class ProductApplicationsController < ApplicationController
  before_action :set_product_application, only: [:show, :edit, :update, :destroy]

  # GET /product_applications
  def index
    @product_applications = ProductApplication.all
  end

  # GET /product_applications/1
  def show
  end

  # GET /product_applications/new
  def new
    @product_application = ProductApplication.new
  end

  # GET /product_applications/1/edit
  def edit
  end

  # POST /product_applications
  def create
    @product_application = ProductApplication.new(product_application_params)

    if @product_application.save
      redirect_to @product_application, notice: 'Product application was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /product_applications/1
  def update
    if @product_application.update(product_application_params)
      redirect_to @product_application, notice: 'Product application was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /product_applications/1
  def destroy
    @product_application.destroy
    redirect_to product_applications_url, notice: 'Product application was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_application
      @product_application = ProductApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_application_params
      params.require(:product_application).permit(:comment, :amount, :product_id, :plot_id)
    end
end
