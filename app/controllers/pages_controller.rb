class PagesController < ApplicationController

  def home
    # 로그인 상태라면 articles 페이지로 이동시키기
    redirect_to articles_path if logged_in?
  end

  def about

  end

end