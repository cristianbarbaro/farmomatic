class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  # GET /farms
  def index
    @farms = Farm.with_roles([:owner, :viewer], current_user)
  end

  # GET /farms/1
  def show
  end

  # GET /farms/new
  def new
    @farm = Farm.new
  end

  # GET /farms/1/edit
  def edit
  end

  # POST /farms
  def create
    @farm = Farm.new(farm_params)

      if @farm.save
        @farm.users << current_user
        # Add admin in farm role to user associated. User is current_user (logged in)
        current_user.add_role :owner, @farm
        redirect_to @farm, notice: 'Farm was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /farms/1
  def update
      if @farm.update(farm_params)
        redirect_to @farm, notice: 'Farm was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /farms/1
  def destroy
    @farm.destroy
      redirect_to farms_url, notice: 'Farm was successfully destroyed.'
  end

  private
    def check_permissions_farm(farm)
      current_user.has_role? :owner, farm or current_user.has_role? :viewer, farm
    end

  # Use callbacks to share common setup or constraints between actions.
    def set_farm
      @farm = Farm.find(params[:id])
      if not check_permissions_farm @farm
        head 403
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farm_params
      params.require(:farm).permit(:name, :description, :address)
    end
end
