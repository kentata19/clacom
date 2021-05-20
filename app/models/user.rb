class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #アソシエーション関係
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :user_posts, dependent: :destroy

  mount_uploader :profile_photo, ProfilePhotoUploader

  #devise関係
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
