class HomesController < ApplicationController

 def index
   @blogpost=Blogpost.all
   @blogposts = Blogpost.order(:id).page(params[:page]).per(6)
   @comment = Comment.all
  
 end
 

end