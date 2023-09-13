# spec/models/book_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
    describe "validations" do
      it "is valid with valid attributes" do
        author = Author.create(author_name: "John Doe")
        book = Book.new(title: "Sample Title", publication_year: "2023", author: author)
        expect(book).to be_valid
      end
  
      it "is not valid without a title" do
        author = Author.create(author_name: "John Doe")
        book = Book.new(title: nil, publication_year: "2023", author: author)
        expect(book).not_to be_valid
        expect(book.errors[:title]).to include("can't be blank")
      end
  
      it "is not valid with a title longer than 50 characters" do
        author = Author.create(author_name: "John Doe")
        book = Book.new(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fringilla.", publication_year: "2023", author: author)
        expect(book).not_to be_valid
        expect(book.errors[:title]).to include("is too long (maximum is 50 characters)")
      end
  
      it "is not valid without a publication year" do
        author = Author.create(author_name: "John Doe")
        book = Book.new(title: "Sample Title", publication_year: nil, author: author)
        expect(book).not_to be_valid
        expect(book.errors[:publication_year]).to include("can't be blank")
      end
  
      it "is not valid with a publication year that is not 4 characters long" do
        author = Author.create(author_name: "John Doe")
        book = Book.new(title: "Sample Title", publication_year: "20233", author: author)
        expect(book).not_to be_valid
        expect(book.errors[:publication_year]).to include("is the wrong length (should be 4 characters)")
      end
  
      it "is not valid without an associated author" do
        book = Book.new(title: "Sample Title", publication_year: "2023", author: nil)
        expect(book).not_to be_valid
        expect(book.errors[:author]).to include("must exist")
      end
    end
  
    describe "associations" do
      it "belongs to an author" do
        author = Author.create(author_name: "John Doe")
        book = Book.new(title: "Sample Title", publication_year: "2023", author: author)
        expect(book.author).to eq(author)
      end
    end
end