class UsersController < ApplicationController
    def show
        @user = User.find_by_id(params[:id])
        @articles = Article.all.where(user: params[:id])
    end
    def index

    end
end
