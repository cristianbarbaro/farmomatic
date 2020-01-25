class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
    def check_permissions_owner
      #head 403 unless current_user.has_role? :owner, @farm
      return unless !current_user.has_role? :owner, @farm
      redirect_to root_path, notice: "Debe tener rol de owner para acceder al recurso."
    end

    def check_permissions_expert
      return unless !current_user.has_role? :expert
      #head 403 unless current_user.has_role? :expert
      redirect_to root_path, notice: "Solo se permite acceso a usuarios expertos."
    end

    def authorized_admin
      return unless !current_user.has_role? :admin
      redirect_to root_path, notice: '¡Solo se permite el acceso a usuarios administradores!'
    end

end
