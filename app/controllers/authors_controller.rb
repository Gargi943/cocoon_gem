class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end
  
  def edit
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
    @author.books.build
    # @book = Book.new
    # 5.times { @author.books.build }
  end
  
  def create
   @author = Author.new(author_params)
    if params[:add_book]
      # add empty book associated with @author
      @author.books.build
    elsif params[:remove_book]
      # nested model that have _destroy attribute = 1 automatically deleted by rails
    else
      if @author.save
      redirect_to @author and return
      end
    end
      render 'new'
  end
  
  def update
  @author = Author.find(params[:id])
    if @author.update(author_params)
       redirect_to @author
    else
       render 'edit'
   end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
 
    redirect_to authors_path
  end
 
  private
    def author_params
      params.require(:author).permit(:name, books_attributes: [:title, :_destroy])
    end
end




