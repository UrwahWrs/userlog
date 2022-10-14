class BlogpostsController < ApplicationController



  

  def index

    @blogposts=Blogpost.order(created_at: :desc).active_blogs.page(params[:page]).per(6)

    if params["blogposts"] =="all" && Current.blogger.nil?
      @blogposts=@blogposts.where(:status => 'public').order(created_at: :desc).active_blogs.page(params[:page]).per(6)
    elsif params["blogposts"] =="all" && Current.blogger.present?
      @blogposts=@blogposts.where(:status => 'public').where.not(:blogger_id => Current.blogger.id).order(created_at: :desc).active_blogs.page(params[:page]).per(6)
    elsif params["blogposts"] =="myposts" 
        @blogposts=Current.blogger.blogposts.all.order(created_at: :desc).page(params[:page]).per(6)
    elsif params["blogposts"] =="liked" 
      @blogposts=Current.blogger.favorites.all.order(created_at: :desc).active_blogs.page(params[:page]).per(6)
    elsif params["blogposts"] =="published"
      @blogposts= Current.blogger.blogposts.where(:status => "public").order(created_at: :desc).active_blogs.page(params[:page]).per(6)
    elsif params["blogposts"] =="unpublished"
      @blogposts=Current.blogger.blogposts.where.not(:status => "public").order(created_at: :desc).page(params[:page]).per(6)
    else
      
    end

    @comment = Comment.new

    if params[:search] && params[:search] != ""
      @blogposts = @blogposts.where("title LIKE ? OR category LIKE ?",
        "%#{params[:search]}%", "%#{params[:search]}%")
        
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
        redirect_to blogposts_path(:blogposts =>'myposts'), notice: "Blogpost post added successfully!"
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
        redirect_to blogpost_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def favorite
     

      type = params[:type]
      if type == "favorite"
        Current.blogger.favorites << Blogpost.find(params[:blogpost_id])
        redirect_to blogposts_path(:blogposts =>'all'),  notice: 'Post added to your favorites.'
  
      elsif type == "unfavorite"
        Current.blogger.favorites.delete(Blogpost.find(params[:blogpost_id]))
        redirect_to blogposts_path(:blogposts =>'all'), notice: 'Post removed from favorites'
  
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
      redirect_to blogposts_path(:blogposts =>'myposts'), status: :see_other
      end
    end
 private 

  def blogpost_params
    params.require(:blogpost).permit(:title, :category, :image, :description, :status) 
  end

end