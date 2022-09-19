class RegisterController < ApplicationController
    def new
        @blogger=Blogger.new
    end
   def create
    @blogger=Blogger.new(blogger_params)
    if @blogger.save
        redirect_to root_path, notice: "Account ceated successfully!"
    else
        render :new, status: :unprocessable_entity
     end
   end

   private

   def blogger_params
        params.require(:blogger).permit(:first_name, :last_name, :email)
   end
end