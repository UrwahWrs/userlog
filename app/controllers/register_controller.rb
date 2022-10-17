class RegisterController < ApplicationController
    
    def new
        @blogger=Blogger.new
    end

   def create
    if params[:password => :confirm_password]
    @blogger=Blogger.new(blogger_params)
        if @blogger.save
            session[:blogger_id]=@blogger.id
            redirect_to blogposts_path, notice: "Account has been created successfully!"
        else
            render :new, status: :unprocessable_entity
        end
    else
        redirect_to register_path, notice: "Password and Confirm_Password don't match! "
    end
   end

   private

   def blogger_params
        params.require(:blogger).permit(:first_name, :last_name, :email, :password, :password_confirmation)
   end
end