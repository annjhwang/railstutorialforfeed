class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.likes.build()

    respond_to do |format|
      if @post.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:post, :username)
    end
end
