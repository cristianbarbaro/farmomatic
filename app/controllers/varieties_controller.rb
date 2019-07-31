class VarietiesController < ApplicationController
  before_action :set_variety, only: [:show, :edit, :update, :destroy]

  # GET /varieties
  def index
    @varieties = Variety.all
  end

  # GET /varieties/1
  def show
  end

  # GET /varieties/new
  def new
    @variety = Variety.new
  end

  # GET /varieties/1/edit
  def edit
  end

  # POST /varieties
  def create
    @variety = Variety.new(variety_params)

    if @variety.save
      redirect_to @variety, notice: 'Variety was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /varieties/1
  def update
    if @variety.update(variety_params)
      redirect_to @variety, notice: 'Variety was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /varieties/1
  def destroy
    @variety.destroy
    redirect_to varieties_url, notice: 'Variety was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variety
      @variety = Variety.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variety_params
      params.require(:variety).permit(:name, :scientificName, :url, :description)
    end
end
