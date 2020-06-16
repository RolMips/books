# app/controllers/books_controller.rb
class BooksController < ApplicationController
  #before_action permet d’appeler la fonction set_current_user avant toutes les autres
  before_action :set_current_user, :set_categories
  #Méthode/Fonction index
  def index
    @books = Book.all.page(params[:page]).per(5)
    @book = Book.new # afin d'exploiter le helper form_for
    @erreur=""
  end
  #Méthode/Fonction show
  def show
    @book = Book.find(params[:id])
  end
  #Méthode/Fonction create
  def create
    @book = Book.create title: params[:book_title], category_id: params[:book_category]
    if @book.save
      flash[:success] = "Le nouveau livre a été ajouté."
      redirect_to "/books"
    else
      @books = Book.all.page(params[:page]).per(5)
      render :index
    end
  end
  #Méthode/Fonction update
  def update
    @book = Book.find(params[:id])
    if params[:book_update]!= nil
      @book.title=params[:book_title]
      @book.category_id=params[:book_category]
      if @book.save
        flash[:success] = "Le livre a été mis à jour."
        redirect_to "/books/#{params[:id]}"
      else
        render :show
      end
    else
      @book.destroy
      redirect_to "/books"
    end
  end
end
