class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authorized_admin

    def index
        @users = User.all
    end
  
    def edit
    end
  
    def show
    end

    def update

        if user_params[:user_id]

            if user_params[:admin] == "1"

                @user = User.find(user_params[:user_id])
                @user.add_role :admin
                flash[:success] = 'Se ha agregado el rol de administrador al usuario.'
            elsif user_params[:admin] == "0"
                @user.remove_role :admin
                flash[:success] = 'Se ha removido el rol de administrador al usuario.'
            end

            redirect_to admin_user_path @user
        else
            render :edit
        end
    end
  
    def destroy
        if @user.destroy
            flash[:success] = "El usuario se ha eliminado correctamente."
        else
            flash[:alert] = "No se pudo eliminar el usuario. Vuelva a intentarlo."
        end
        redirect_to admin_users_url
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:user_id, :admin)
      end

end