class ArticlesController < ApplicationController

  def new
    # Article 객체 생성
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end
  
  # article_params 메서드 생성
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end