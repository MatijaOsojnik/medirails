class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    # commontator_thread_show(@article)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if article_params["photo"]
      @article.photo.purge
      @article.photo.attach(article_params["photo"])
    end

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update

    @article.user = current_user
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bookmark
    @article = Article.find(params[:id])
    Bookmark.create(user_id: current_user.id, article_id: @article.id)
    redirect_to article_path(@article)
  end

  def delete_bookmark
    @article = Article.find(params[:id])
    @article.bookmarks.where(user: current_user).destroy_all
    redirect_to article_path(@article)
  end

  def find_bookmarks
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def like
    @article = Article.find(params[:id])
    Like.create(user_id: current_user.id, article_id: @article.id)
    redirect_to article_path(@article)
  end

  def delete_like
    @article = Article.find(params[:id])
    @article.likes.where(user: current_user).destroy_all
    redirect_to article_path(@article)
  end

  def find_likes
    @likes = Like.where(user_id: current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :thumbnail_url, :photo)
    end

    def authorize_user!
      redirect_back fallback_location: root_path, alert: 'Nimate dostopa do te strani.' unless current_user == @article.user || current_user.admin?
    end
end
