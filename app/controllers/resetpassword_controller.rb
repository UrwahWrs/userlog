class ResetpasswordController < ApplicationController
 before_action :require_blogger_logged_in!
    def index

    end
    def update
        Current.blogger.update(password_params)
        redirect_to root_path, notice: "password updated!"
    end

    private

    def password_params
        params.require(:blogger).permit(:password, :password_confirmation)

    end

end