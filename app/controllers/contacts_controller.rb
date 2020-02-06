class ContactsController < ApplicationController

  # получение страницы
  def new
  end

  # прием параметров на сервере и создание сущности в БД
  def create
    # как в Sinatr'e 
    # @contact = Contact.new(params[:contact])
    # в Ruby будет ош. использ запрещенных атрибутов
    # нужно использовать метод private - нет доступа к методам из вне

    # получение параметра из БД
    @contact = Contact.new(contact_params)

    # сохранение полученных данных в БД 
    # @contact.save и вызов представления create.html.erb
    # если не valid то возврашаем форму new
    # ключ - action:   значение - возвращает форму new
    if @contact.valid?
      @contact.save
    else
      render action: 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end
