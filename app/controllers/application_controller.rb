class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
    def check_permissions_owner
      head 403 unless current_user.has_role? :owner, @farm
    end

end
