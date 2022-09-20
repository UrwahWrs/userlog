class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        if session[:blogger_id]
            Current.blogger=Blogger.find_by(id: session[:blogger_id])
        end

    end
end
