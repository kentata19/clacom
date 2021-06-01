class ComposersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  def new
    @composer = Composer.new
  end
  def create
    @composer = Composer.create(composer_params)
    
    if @composer.save
      redirect_to composer_path(@composer)
      flash[:notice] = "新規作曲家を登録しました"
    else
      redirect_to new_composer_path
      flash[:alert] = "登録に失敗しました"
    end

  end
  def show
    @composer = Composer.find(params[:id])
    @posts = PostComposer.where(composer_id: @composer.id).pluck(:post_id)
    render layout: false  
  end
  def edit
    @composer = Composer.find_by(id: params[:id])
  end
  def update
    @composer = Composer.find(params[:id])
    @composer.update(composer_params)
    
    if @composer.update(composer_params)
      redirect_to composer_path(@composer)
      flash[:notice] = "プロフィールを編集しました"
    else
      redirect_to update_composer_path(@composer)
      flash[:alert] = "編集に失敗しました"
    end
  end
  private
    def composer_params
      params.require(:composer).permit(:name, :profile_photo, :information)
    end
end
