class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:notice] = "can't successfully access!"
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully update user!"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @user = current_user
    @users = User.all.order(created_at: :desc)
    @book = Book.new
  end

  def top
  end

  def about
  end

  private
  def user_params
    params.require(:user).permit(:username, :profile_image,:comment)
  end
end
