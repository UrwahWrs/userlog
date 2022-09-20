class UserloginController < ApplicationController
    def new 
        
    end

    def create
        blogger = Blogger.find_by(email: params[:email])
        if blogger.present? && blogger.authenticate(params[:password])
            session[:blogger_id]=blogger.id
            redirect_to dashboard_path, notice: "logged in!"
        else
            flash[:alert]= "Invalid Email or Password"
            render :new, status: :unprocessable_entity
        end

    end
    def destroy
        session[:blogger_id]= nil 
        redirect_to root_path, notice: "logged out!"

    end
end
