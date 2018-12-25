class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    # 데이터베이스에서 모든 article을 가져온다.
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    debugger
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show

  end

  def edit
    #특정 article을 가져오는 것

  end

  def update

    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article) #article show page
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

end