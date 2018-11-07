class BookController < ApplicationController
  def show
  	@book = Book.new
  	@booker = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  		flash[:notice] = "successfully created book!"
     	redirect_to books_path
     else
     	render :index
     end
  end

  def index
  	@book = Book.new
  	@books = Book.all.order(created_at: :desc)
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	@book.user_id = current_user.id
  	if @book.update(book_params)
  		flash[:notice] = "successfully edited!"
  		redirect_to books_path
  	else
  		render :edit
  	end
end
