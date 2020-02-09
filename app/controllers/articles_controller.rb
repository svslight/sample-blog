class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # возвращает в Браузер форму из new.html.erb
  def new    
  end

  def create
    # выводит содержимое на экран
    # render - возвращает данные в текстовом виде
    # render plain: params[:article].inspect

    # получение параметра из БД
    @article = Article.new(article_params)

    # сохранение полученных данных в БД 
    # по-умолчанию save выполняет valid (@article.valid?)
    # render - возвращает, то что сгенерировал action в new (не прерывает тек.запрос)
    # redirect_to - прерывает запрос и возвращает браузер на указанную страницу
    if @article.save
      redirect_to @article   # /article/id - Action show
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to @article   # /article/id - Action show
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end



  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
