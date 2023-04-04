class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy like unlike ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.new(article_params.except(:tag_list))

    respond_to do |format|
      if @article.save
        @article.sync_tags(article_params[:tag_list])
        format.html { redirect_to article_url(@article) }
        format.json { render :show, status: :created, location: @article }
        flash[:notice] = "文章创建成功"
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params.except(:tag_list))
        format.html { redirect_to article_url(@article) }
        format.json { render :show, status: :ok, location: @article }
        flash[:notice] = "文章更新成功"
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
      flash[:notice] = "文章删除成功"
    end
  end

  def like
    unless @article.liked_by?(current_user)
      @like = @article.likes.create(user_id: current_user.id)
    end
    respond_to do |format|
        format.js
    end
  end

  def unlike
    if @article.liked_by?(current_user)
      @like = @article.likes.find_by(user_id: current_user.id)
      @like.destroy
    end
    respond_to do |format|
        format.js
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :description, :body, :tag_list)
  end


  def render_article
    format.html { redirect_to article_url(@article) }
    # format.html { redirect_to article_url(@article) }
    # format.json { render :show, status: :created, location: @article }
    # render json: { article: @article.as_json({}, @current_user) }
  end
end 
