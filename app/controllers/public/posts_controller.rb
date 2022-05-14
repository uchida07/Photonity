class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def search_tag
     @post = Post.new
     @posts = Post.search(params[:keyword])
     @keyword = params[:keyword]
  end

  def tag_index
    @tag = Post.all
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @reply = Reply.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    @post.save
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  private
  def post_params
    params.require(:post).permit(:title, :introduction, :machine, :image, :tag)
  end

end
