class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
    def check_permissions_owner
      head 403 unless current_user.has_role? :owner, @farm
    end

    def check_permissions_expert
      head 403 unless current_user.has_role? :expert
    end

end
