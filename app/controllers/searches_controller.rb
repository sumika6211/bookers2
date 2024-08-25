class SearchesController < ApplicationController
  def search
    @word = params[:word]
    @range = params[:range]
    @books = Book.all.includes(:tags)
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "Book"
      @books = @books.looks(params[:search], params[:word])
    else
      @books = @books.where("book_tags.tag.name": params[:tag_name])
    end
  end
end