require_relative 'lib/database_connection'
require_relative "lib/books_repository"

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, title FROM books;'
result = DatabaseConnection.exec_params(sql, [])

books_repository = BooksRepository.new

# Print out each record from the result set .
# result.each do |record|
#   p record
# end

# Print out each record from the result set eg '1 - Nineteen Eighty-Four - George Orwell'.
books_repository.all.each do |record|
  p "#{record.id} - #{record.title} - #{record.author_name}"
end