class ArticlesController < ApplicationController

  # возвращает в Браузер форму из new.html.erb
  def new    
  end

  def create
    # выводит содержимое на экран
    # render plain: params[:article].inspect

    # получение параметра из БД
    @article = Article.new(article_params)

    # сохранение полученных данных в БД 
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
