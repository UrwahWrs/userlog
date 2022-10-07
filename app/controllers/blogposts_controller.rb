class BlogpostsController < ApplicationController


  # before_action :require_blogger_logged_in!
  # before_action :authenticate_user!, only: :toggle_favorite 

  def toggle_favorite
    @blogpost = Blogpost.find_by(id: params[:id])
    current_blogger.favorited?(@blogpost) ? current_blogger.unfavorite(@blogpost) : current_blogger.favorite(@blogpost)
  end
  

  def index
    @pagy, @blogposts=pagy(Blogpost.all, items: 6)
    @comment = Comment.new

    if params[:search] && params[:search] != ""
      @blogposts = @blogposts.where("title LIKE ? OR category LIKE ?",
        "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @blogposts=Blogpost.all
    end    
    
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

    
    def destroy
      debugger
      @blogpost = Blogpost.find(params[:id])
      if @blogpost.destroy
      redirect_to @blogposts, status: :see_other
      end
    end

  def blogpost_params
    params.require(:blogpost).permit(:title, :category, :image, :description, :status) 
  end

      

     
end