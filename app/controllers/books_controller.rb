class BooksController < ApplicationController
  def index
    @books = Book.paginate(page: params[:page], per_page: 10)
  end

  def index_json
    @books = Book.all
    render json: @books
  end

  def show
    # Aksi ini akan menampilkan detail buku berdasarkan ID
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: 'Buku berhasil ditambahkan.'
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: 'Buku berhasil diperbarui.'
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Buku berhasil dihapus.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :publication_year, :author_id)
  end
end
