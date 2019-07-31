class PlantationsController < ApplicationController
  before_action :set_plantation, only: [:show, :edit, :update, :destroy]

  # GET /plantations
  def index
    @plantations = Plantation.all
  end

  # GET /plantations/1
  def show
  end

  # GET /plantations/new
  def new
    @plantation = Plantation.new
  end

  # GET /plantations/1/edit
  def edit
  end

  # POST /plantations
  def create
    @plantation = Plantation.new(plantation_params)

    if @plantation.save
      redirect_to @plantation, notice: 'Plantation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /plantations/1
  def update
    if @plantation.update(plantation_params)
      redirect_to @plantation, notice: 'Plantation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /plantations/1
  def destroy
    @plantation.destroy
    redirect_to plantations_url, notice: 'Plantation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plantation
      @plantation = Plantation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plantation_params
      params.require(:plantation).permit(:comment, :amount, :plot_id, :species_id)
    end
end
