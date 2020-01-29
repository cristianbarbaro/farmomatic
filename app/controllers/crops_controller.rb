class CropsController < ApplicationController
  before_action :set_farm
  before_action :set_plot
  before_action :set_crop, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions_owner, only: [:new, :create, :edit, :update, :destroy]

  # GET /farms/:farm_id/plots/:plot_id/crops
  def index
    @crops = @plot.crops
  end

  # GET /farms/:farm_id/plots/:plot_id/crops/:id
  def show
  end

  # GET /farms/:farm_id/plots/:plot_id/crops/new
  def new
    @crop = @plot.crops.build
    @crop.build_other
  end

  # GET /farms/:farm_id/plots/:plot_id/crops/:id/edit
  def edit
  end

  # POST /farms/:farm_id/plots/:plot_id/crops
  def create
    @crop = @plot.crops.build(crop_params)
    @crop.remove_blank_other
    if @crop.save
      redirect_to farm_plot_crops_path(@farm, @plot), notice: 'Crop was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farms/:farm_id/plots/:plot_id/crops/:id
  def update
    if @crop.update(crop_params)
      redirect_to farm_plot_crop_path(@farm, @plot), notice: 'Crop was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farms/:farm_id/plots/:plot_id/crops/:id
  def destroy
    @crop.destroy
    redirect_to farm_plot_crops_path, notice: 'Crop was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crop
      @crop = @plot.crops.find(params[:id])
    end

    def set_farm
      @farm = Farm.find(params[:farm_id])
    end

    def set_plot
      @plot = @farm.plots.find(params[:plot_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crop_params
      params.require(:crop).permit(:comment, :amount, :variety_id, :user_id, 
                                  other_attributes: [:id, :name, :description])
    end
end
