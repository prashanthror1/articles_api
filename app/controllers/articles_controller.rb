# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    if params[:search]
      @articles = Article.where("title like ? or body like ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @articles = Article.all
    end
    paginate json: @articles, per_page: APP_CONFIG['pagination_per_page']
  end

  # POST /articles
  def create
    @article = Article.create!(article_params)
    json_response(@article, :created)
  end

  # GET /articles/:id
  def show
    json_response(@article)
  end

  # PUT /articles/:id
  def update
    @article.update(article_params)
    head :no_content
  end

  # DELETE /articles/:id
  def destroy
    @article.destroy
    head :no_content
  end

  private

  def article_params
    # whitelist params
    params.permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
