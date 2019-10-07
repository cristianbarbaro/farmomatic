class ProductApplicationsController < ApplicationController
  before_action :set_farm
  before_action :set_plot
  before_action :set_product_application, only: [:show, :edit, :update, :destroy]

  # GET /farms/:farm_id/plots/:plot_id/product_applications
  def index
    @product_applications = @plot.product_applications
  end

  # GET /farms/:farm_id/plots/:plot_id/product_applications/:id
  def show
  end

  # GET /farms/:farm_id/plots/:plot_id/product_applications/new
  def new
    @product_application = @plot.product_applications.build
  end

  # GET /farms/:farm_id/plots/:plot_id/product_applications/:id/edit
  def edit
  end

  # POST /farms/:farm_id/plots/:plot_id/product_applications
  def create
    @product_application = @plot.product_applications.build(product_application_params)

    if @product_application.save
      redirect_to farm_plot_product_applications_path(@farm, @plot), notice: 'Product application was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /farms/:farm_id/plots/:plot_id/product_applications/:id
  def update
    if @product_application.update(product_application_params)
      redirect_to farm_plot_product_application_path(@farm, @plot), notice: 'Product application was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farms/:farm_id/plots/:plot_id/product_applications/:id
  def destroy
    @product_application.destroy
    redirect_to farm_plot_product_applications_path, notice: 'Product application was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_application
      @product_application = @plot.product_applications.find(params[:id])
    end

    def set_farm
      @farm = Farm.find(params[:farm_id])
    end

    def set_plot
      @plot = @farm.plots.find(params[:plot_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_application_params
      params.require(:product_application).permit(:comment, :amount, :product_id)
    end
end
