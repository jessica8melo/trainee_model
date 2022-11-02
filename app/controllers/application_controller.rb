class ApplicationController < ActionController::API
    private

    def authentication_admin
        unless current_user.is_admin == true
            head(:unauthorized)
        end
    end
end