class HomesController < ApplicationController

 def index
    @blogposts = Blogpost.all
    @comment = Comment.all
 end

end