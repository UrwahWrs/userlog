class BlogpostsController < ApplicationController


  # before_action :require_blogger_logged_in!

    def index
      @blogposts=Blogpost.all
      @blogposts = Blogpost.order(:id).page(params[:page]).per(6)
      @comment = Comment.new
      	
      if params[:search_key]
        @blogposts = Blogpost.where("title LIKE ? OR description LIKE ? ", 
        "%#{params[:search_key]}%", "%#{params[:search_key]}%")
      else
        @blogposts = Blogpost.all
      end
    end

    def new
      @blogpost=Blogpost.new
    end

    def show
      @blogpost = Blogpost.find(params[:id])
      @blogposts = Blogpost.order("name").page(params[:page]) 
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
       
        @blogpost = Blogpost.find(params[:id])
        if @blogpost.destroy
        redirect_to @blogpost, status: :see_other
        end
      end

    def blogpost_params
      params.require(:blogpost).permit(:title, :category, :image, :description, :status) 
    end

      

     
end