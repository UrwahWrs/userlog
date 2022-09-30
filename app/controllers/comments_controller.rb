class CommentsController < ApplicationController
  #   def create
  #     @blogpost = Blogger.find(session[:blogpost_id])
     
  #    @comment = @blogger.blogposts.create(blogpost_params)
     
  #     if @comment.save
  #       redirect_to root_path, notice: "Comment post added successfully!"
  #     else
  #       render :new, status: :unprocessable_entity
  #     end
  #   end

  #   def edit
     
  #     @comment = Comment.find(params[:id])

  #   end
  
  #   def update
     
  #     @comment = Comment.find(params[:id])
  
  #     if @comment.update(blogpost_params)
  #       redirect_to root_path
  #     else
  #       render :edit, status: :unprocessable_entity
  #     end
  #   end

    
  #   def destroy
     
  #     @comment = Comment.find(params[:id])
  #     @comment.destroy!
  #     if @comment.destroy
  #     redirect_to @comment, status: :see_other
  #     end
  #   end

  #  def blogpost_params
  #   params.require(:comment).permit(:body, :category, :description) 
  #  end
   
  def create
    @blogpost = Blogpost.find(params[:blogpost_id])
    @comment = @blogpost.comments.create(comment_params)
    redirect_to blogposts_path
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
