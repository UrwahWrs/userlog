class ApplicationController < ActionController::Base
    before_action :set_current_blogger

    def set_current_blogger
        if session[:blogger_id]
            Current.blogger=Blogger.find_by(id: session[:blogger_id])
        end

    end

    def require_blogger_logged_in!
        redirect_to userlogin_path, notice: "You must be logged in!" if Current.blogger.nil?
    
    end
end
