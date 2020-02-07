class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

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
      redirect_to @article   # /article/id - Action show
    else
      render action: 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
