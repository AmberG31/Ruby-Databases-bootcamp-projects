require "books_repository"

  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
    connection.exec(seed_sql)
  end
  
  describe BooksRepository do
    before(:each) do 
      reset_books_table
    end

    it "#all returns all books" do
      repo = BooksRepository.new
      books = repo.all

      expect(books.length).to eq 2
      expect(books[0].id).to eq 1
      expect(books[0].title).to eq 'Nineteen Eighty-Four'
      expect(books[0].author_name).to eq 'George Orwell'

      expect(books[1].id).to eq 2
      expect(books[1].title).to eq 'Mrs Dalloway'
      expect(books[1].author_name).to eq 'Virginia Woolf'
    end

    it "#find returns a single book based on id" do 
      repo = BooksRepository.new
      books = repo.find(1)
      expect(books.id).to eq 1
      expect(books.title).to eq 'Nineteen Eighty-Four'
      expect(books.author_name).to eq 'George Orwell'
    end

end