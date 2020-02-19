class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search,:top,:infomation]
  def index
    @posts = Post.includes(:user)
  end
  def new
    @post =Post.new 
  end
  def create
    Post.create(post_params)
    redirect_to root_path
  end
  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end
  def edit
  end
  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
  def search
    @posts = Post.search(params[:keyword])
  end

  def top
  end
  
  def infomation
  end

  
  

  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end
  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
