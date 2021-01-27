class CommentsController < ApplicationController
  before_action :set_comment, except: [:index, :create, :show]
  before_action :set_article_comment, only: [:index]

  # GET /comments
  def index
    if @article
      @comments = Comment.where("article_id = ?", @article)
    else
      @comments = Comment.all
    end
    paginate json: @comments, per_page: APP_CONFIG['pagination_per_page']
  end

  # GET /comments/:id
  def show
    @comment = Comment.find(params[:id])
    json_response(@comment)
  end

  # POST /comments
  def create
    @comment = Comment.create!(comment_params)
    json_response(@comment, :created)
  end

  # PUT comments/:id
  def update
    puts params.inspect
    @comment.update(comment_params)
    head :no_content
  end

  # DELETE /comments/:id
  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.permit(:article_id, :commenter, :body, :id)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_article_comment
    @comment = @article.comments.find_by!(id: params[:id]) if @article
  end
end
