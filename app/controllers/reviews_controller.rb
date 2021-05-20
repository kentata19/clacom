class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  def new
    @review = Review.new
    @post = Post.find(params[:id])
  end
  def create
    @review = Review.create(review_params)
    @review.save
    if @review.save
      redirect_to review_path(@review)
      flash[:notice] = "感想を投稿しました"
    else
      redirect_to new_review_path
      flash[:alert] = "投稿に失敗しました"
    end

  end
  def index
    @reviews = Review.all
  end
  def show
    @review = Review.find(params[:id])
    @post = @review.post
    @user = @review.user
  end
  def edit
    @review = Review.find_by(id: params[:id])
    @post = @review.post
  end
  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    
    if @review.update(review_params)
      redirect_to review_path(@review)
      flash[:notice] = "投稿を編集しました"
    else
      redirect_to update_review_path(@review)
      flash[:alert] = "編集に失敗しました"
    end
  end
  private
    def review_params
      params.require(:review).permit(:caption, :instrument, :orchestra, :performance).merge(user_id: current_user.id, post_id: params[:review][:post_id])
    end
end
