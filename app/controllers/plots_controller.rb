class PlotsController < ApplicationController
  before_action :set_plot, only: [:show, :edit, :update, :destroy]

  # GET /plots
  def index
    @plots = Plot.all
  end

  # GET /plots/1
  def show
  end

  # GET /plots/new
  def new
    @plot = Plot.new
  end

  # GET /plots/1/edit
  def edit
  end

  # POST /plots
  def create
    @plot = Plot.new(plot_params)

    if @plot.save
      redirect_to @plot, notice: 'Plot was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /plots/1
  def update
    if @plot.update(plot_params)
      redirect_to @plot, notice: 'Plot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /plots/1
  def destroy
    @plot.destroy
      redirect_to plots_url, notice: 'Plot was successfully destroyed.'
      head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plot
      @plot = Plot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plot_params
      params.require(:plot).permit(:identifier, :description, :surface, :greenhouse, :farm_id)
    end
end
