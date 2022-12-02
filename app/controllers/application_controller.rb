class ApplicationController < ActionController::API
    def require_login
        head(:unauthorized) unless current_user.present?
    end
    
    private

    def authentication_admin
        unless current_user.is_admin == true
            head(:unauthorized)
        end
    end
end