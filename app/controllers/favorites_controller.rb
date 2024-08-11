class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    current_user.favorites.find_or_create_by(book_id: @book.id)
    #favorite = current_user.favorites.new(book_id: book.id)
    #favorite.save
    render 'favorites/button_toggle'
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy if favorite
    #favorite = current_user.favorites.find_by(book_id: book.id)
    #favorite.destroy
    render 'favorites/button_toggle'
  end

end
