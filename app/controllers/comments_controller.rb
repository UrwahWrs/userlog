class CommentsController < ApplicationController

   before_action :require_blogger_logged_in!

  def create
    @blogpost = Blogpost.find(params[:blogpost_id])
    @comment = @blogpost.comments.create(comment_params)
    if @comment.save
     render "blogposts/show"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @blogpost = Blogpost.find(params[:blogpost_id])
    @comment = @blogpost.comments.find(params[:id])
    @comment.destroy
    redirect_to blogposts_path(@blogpost), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
