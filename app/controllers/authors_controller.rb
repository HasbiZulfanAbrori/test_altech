class AuthorsController < ApplicationController
    def index
      @authors = Author.paginate(page: params[:page], per_page: 10)
    end

    def new
      @author = Author.new
    end

    def show
      @author = Author.find(params[:id])
    end

    def create
      @author = Author.new(author_params)
  
      if @author.save
        redirect_to authors_path, notice: 'Penulis berhasil ditambahkan.'
      else
        render 'new'
      end
    end

    def edit
      @author = Author.find(params[:id])
    end    

    def update
      @author = Author.find(params[:id])
    
      if @author.update(author_params)
        redirect_to authors_path, notice: 'Penulis berhasil diperbarui.'
      else
        render 'edit'
      end
    end    

    def destroy
      @author = Author.find(params[:id])
      @author.destroy
    
      redirect_to authors_path, notice: 'Penulis berhasil dihapus.'
    end    

    private
    
    def set_author
        @author = Author.find(params[:id])
        return unless @author.nil?
    
        render json: { status: 404, message: 'author not found' }, status: 404
    end

    def author_params
      params.require(:author).permit(:author_name)
    end
end
