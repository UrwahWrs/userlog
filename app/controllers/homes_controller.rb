class HomesController < ApplicationController

 def index
  @blogposts=Blogpost.where(blogger_id: Current.blogger.id).order(created_at: :desc).page(params[:page]).per(5)
  @comment = Comment.new
  if params[:search] && params[:search] != ""
    @blogposts = @blogposts.where("title LIKE ? OR category LIKE ?",
        "%#{params[:search]}%", "%#{params[:search]}%")
    end 
  end
 

end