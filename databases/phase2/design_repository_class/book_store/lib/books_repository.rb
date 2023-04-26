require_relative "./books"

class BooksRepository

    # Selecting all records
    # No arguments
    def all
      sql = 'SELECT id, title, author_name FROM books;'
      result_set = DatabaseConnection.exec_params(sql,[])

      books = []
      result_set.each do |record|
        book = Books.new
        book.id = record['id'].to_i
        book.title = record['title']
        book.author_name = record['author_name']

        books << book
      end
      return books
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      sql = 'SELECT id, title, author_name FROM books WHERE id = $1;'
      params = [1]

      book1 = DatabaseConnection.exec_params(sql,params)[0]

      book = Books.new
      book.id = book1['id'].to_i
      book.title = book1['title']
      book.author_name = book1['author_name'] 
    
      return book
      # Returns a single Student object.
    end
end