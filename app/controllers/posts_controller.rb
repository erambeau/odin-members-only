class PostsController < ApplicationController

    before_action :require_login, except: [:index, :show]
    #before_action :authentificate_user!, except: [:index, :show]

    def index
        @posts = Post.all
        @users = User.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        #@post = Post.new(post_params)

        if @post.save
            redirect_to new_post_path
        else
            render :new, status: :unprocessable_entity
        end

    end



    private
    def require_login

    end

    def post_params
      #params.require(:post).permit(:title, :body)
      params.require(:post).permit(:title, :body, :user_id)
    end

end


