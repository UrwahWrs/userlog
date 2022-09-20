# You will create a blogging application. Blog will be standard e.g Image, description, title, published date, author name, tags/category

# 1. User can login/signup in the application
# 2. Logged in user can create/edit/delete their own blogs.
# 3. Logged in user can publish/unpublish his blogs
# 4. Only published blogs will appear on public site.
# 5. Other users can be able to post comments on that blog and so it will have threads of comments just like Facebook.
# 6. On public site users can search blogs by title, category, author, published date 

class HomeController < ApplicationController

    def index
       
      end
    
      def show
        @blog = Blog.find(params[:id])
      end
    
      def new
        @blog = Blog.new
      end
    
      def create
        @blog= Blog.new(blog_params)
    
        if @blog.save
          redirect_to @blog, notice: "Blog post added successfully!"
        else
          render :new, status: :unprocessable_entity
        end
      end
    
      def edit
        @blog = Blog.find(params[:id])
      end
    
      def update
        @blog = Blog.find(params[:id])
    
        if @blog.update(blog_params)
          redirect_to @Blog
        else
          render :edit, status: :unprocessable_entity
        end
      end
      def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
    
        redirect_to root_path, status: :see_other
      end
      private
      def blog_params
        params.require(:blog).permit(:title, :image, :body, :status)
      end
    
end
