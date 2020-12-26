class AuthorsController < ApplicationController
  def index
    redirect_to signup_url
  end
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      session[:author_id] = @author.id
      redirect_to home_path, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
