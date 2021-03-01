class Api::V1::ArticlesController < Api::ApplicationController
  def index
    @articles = Article.all
    render json: @articles.to_json, status: :ok
  end
end