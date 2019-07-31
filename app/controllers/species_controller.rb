class SpeciesController < ApplicationController
  before_action :set_species, only: [:show, :edit, :update, :destroy]

  # GET /species
  def index
    @species = Species.all
  end

  # GET /species/1
  def show
  end

  # GET /species/new
  def new
    @species = Species.new
  end

  # GET /species/1/edit
  def edit
  end

  # POST /species
  def create
    @species = Species.new(species_params)

      if @species.save
        redirect_to @species, notice: 'Species was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /species/1
  def update
      if @species.update(species_params)
        redirect_to @species, notice: 'Species was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /species/1
  def destroy
    @species.destroy
    redirect_to species_index_url, notice: 'Species was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species
      @species = Species.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def species_params
      params.require(:species).permit(:name)
    end
end
