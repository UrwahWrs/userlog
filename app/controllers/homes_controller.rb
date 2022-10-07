class HomesController < ApplicationController

 def index
  @pagy, @blogposts=pagy(Blogpost.all, items: 6)
   @comment = Comment.all

    if params[:search] && params[:search] != ""
    @blogposts = @blogposts.where("title LIKE ? OR category LIKE ?",
        "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @blogposts=Blogpost.all
    end 
  end
 

end