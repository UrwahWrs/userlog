class BlogpostsController < ApplicationController


  # before_action :require_blogger_logged_in!
  # def toggle_favorite
  #   @blogpost = Blogpost.find_by(id: params[:id])
  #   current_blogger.favorited?(@blogpost) ? current_blogger.unfavorite(@blogpost) : current_blogger.favorite(@blogpost)
  # end
  
  

  def index

   
    @blogposts=Blogpost.order(created_at: :desc).active_blogs.page(params[:page]).per(6)
   
    @comment = Comment.new

    if params[:search] && params[:search] != ""
      @blogposts = @blogposts.where("title LIKE ? OR category LIKE ?",
        "%#{params[:search]}%", "%#{params[:search]}%")
        
    end    
    
  end
  
  def user_posts

    @blogposts=Blogpost.order(created_at: :desc).active_blogs.page(params[:page]).per(6)

  end

  def new
    @blogpost=Blogpost.new
  end

  def show
    @blogpost = Blogpost.find(params[:id])
    
  end
  
    def create
      @blogger = Blogger.find(session[:blogger_id])
      
      @blogpost = @blogger.blogposts.create(blogpost_params)
      
      if @blogpost.save
        redirect_to blogposts_path, notice: "Blogpost post added successfully!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit

      @blogpost = Blogpost.find(params[:id])

    end
  
    def update
      
      @blogpost = Blogpost.find(params[:id])
  
      if @blogpost.update(blogpost_params)
        redirect_to blogposts_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def favorite
     

      type = params[:type]
      if type == "favorite"
        Current.blogger.favorites << Blogpost.find(params[:blogpost_id])
        redirect_to root_path,  notice: 'Post added to your favorites.'
  
      elsif type == "unfavorite"
        Current.blogger.favorites.delete(Blogpost.find(params[:blogpost_id]))
        redirect_to root_path, notice: 'Post removed from favorites'
  
      else
        # Type missing, nothing happens
        redirect_to root_path, notice: 'Nothing happened.'
      end

   
    end

    def show_favorites

      @blogposts=Blogpost.order(created_at: :desc).active_blogs.page(params[:page]).per(6)
      

    end

    def destroy
      @blogpost = Blogpost.find(params[:id])
      if @blogpost.destroy
      redirect_to blogposts_path, status: :see_other
      end
    end
 private 

  def blogpost_params
    params.require(:blogpost).permit(:title, :category, :image, :description, :status) 
  end

end