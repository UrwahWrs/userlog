class ResetpasswordController < ApplicationController
 before_action :require_blogger_logged_in!
    def index

    end
    def update
        debugger
        if params[:password => :confirm_password]
        Current.blogger.update(password_params)
        redirect_to blogposts_path, notice: "password updated!"
        else 
        redirect_to resetpassword_path, notice: "password and confirm_password don't match!"
        end
    end

    private

    def password_params
        params.require(:blogger).permit(:password, :password_confirmation)

    end

end