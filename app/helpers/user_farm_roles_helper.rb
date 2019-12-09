module UserFarmRolesHelper
    ROLES = [:owner, :viewer]

    def check_parameters(params)
        not params[:user_id].blank? and not params[:role].blank? and ROLES.include? params[:role].to_sym
    end
end
