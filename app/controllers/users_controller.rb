class UsersController < ApplicationController

    before_action :authenticate_user!

    def show
        @user = User.find_by_id(params[:id])
        @articles = Article.all.where(user: params[:id])
    end
    def update_password
      @user = current_user
      if @user.update(user_params)
        # Sign in the user by passing validation in case their password changed
        bypass_sign_in(@user)
        redirect_to root_path
      else
        render "edit"
      end
    end

    # def follow_by_article
    #   @article = Article.find(params[:id])
    #   Follow.create(follower_id: current_user.id, followed_id: @article.user.id)
    #   redirect_to article_path(@article)
    # end

    # def unfollow_by_article
    #   @article = Article.find(params[:id])
    #   current_user.followings.find_by(followed_id: @article.user.id).destroy
    #   redirect_to article_path(@article)
    # end

def follow
  @user = User.find(params[:id])
  current_user.followees << @user
  redirect_back(fallback_location: user_path(@user))
end

def unfollow
  @user = User.find(params[:id])
  current_user.followed_users.find_by(followee_id: @user.id).destroy
  redirect_back(fallback_location: user_path(@user))
end

def followers
  @user = User.find(params[:id])
  @followed_users = @user.followed_users
end

def followees
  @user = User.find(params[:id])
  @followees = @user.followees
end

    private
  
    def user_params
      # NOTE: Using `strong_parameters` gem
      params.require(:user).permit(:password, :password_confirmation)
    end
end
