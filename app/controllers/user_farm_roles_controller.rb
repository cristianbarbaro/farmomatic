class UserFarmRolesController < ApplicationController
  before_action :set_farm, only: [:new_users, :add_users, :destroy]
  before_action :check_permissions_owner

  # GET /farms/1/new_users
  def new_users
    #@producers = User.with_role(:producer)
    render :new_users
  end

  # POST /farms/1/add_users
  def add_users
    # TODO: verificar si un usuario ya tiene rol asociado y cuando hay que borrar roles.
    if helpers.check_parameters(user_farm_params)
      @user = User.find(user_farm_params[:user_id])
      #@farm.users << @user
      # Solo deberíamos agregar el rol, y no en la colección de farms, es decir, al assigment. Creo que NO corresponde.
      @user.add_role user_farm_params[:role], @farm
      redirect_to @farm, :notice => "Role user added sucessfully."
    else
      render :new_users, :notice => "Both values is necessary."
    end
  end

  # POST /farms/1/delete_user
  def destroy
    if helpers.check_parameters(user_farm_params)
      @user = User.find(user_farm_params[:user_id])
      @user.remove_role user_farm_params[:role], @farm
      redirect_to @farm, notice: 'User was successfully removed.'
    end
  end

  private
    def check_permissions_farm(farm)
      current_user.has_role? :owner, farm or current_user.has_role? :viewer, farm
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_farm
      @farm = Farm.find(params[:farm_id])
      head 403 unless check_permissions_farm @farm
    end

    def user_farm_params
      params.require(:user).permit(:user_id, :role)
    end

end