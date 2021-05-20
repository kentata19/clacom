class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  def home
    @composers = Composer.first(3)
    @reviews = Review.last(3)
    render layout: false   

  end
  def introduction
  end
  def new
    
    @post = Post.new
    @composers = Composer.all
  end
  def create
    @post = Post.create(post_params)
    if params[:category]
      params[:category].each do | di1,di2 |
        if di2 == "1"
          PostComposer.create(
            post_id: @post.id, 
            composer_id: di1
          )
        end
      end
    end
    UserPost.create(
      post_id: @post.id,
      user_id: current_user.id
    )
    if @post.save
      redirect_to post_path(@post)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_post_path
      flash[:alert] = "投稿に失敗しました"
    end

  end
  def index
    @composers = Composer.all
  end 
  def show
    @post = Post.find(params[:id])
    @composer_id = PostComposer.find_by(post_id: @post.id).composer_id
    @composer = Composer.find(@composer_id)
    @reviews = @post.reviews
  end
  def edit
    @post = Post.find_by(id: params[:id])
    @composers = Composer.all
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if params[:category]
      params[:category].each do | di1,di2 |
        if di2 == "1" && PostComposer.find_by(post_id: @post.id).nil?
          PostComposer.create(
            post_id: @post.id, 
            composer_id: di1
          )
        end
      end
    end
    if UserPost.where(post_id: 8, user_id: 1).present?
    else 
      UserPost.create(
        post_id: @post.id,
        user_id: current_user.id
      )
    end
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:notice] = "投稿を編集しました"
    else
      redirect_to update_post_path(@post)
      flash[:alert] = "投稿に失敗しました"
    end
  end
  private
    def post_params
      params.require(:post).permit(:caption, :circumstance, :configuration, :organization, :column, :thumbnail, :title).merge(user_id: current_user.id)
    end
end
