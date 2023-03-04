use library;
CREATE FUNCTION count_books_by_author(author_id INT) RETURNS INT
BEGIN
  DECLARE book_count INT;
  SELECT COUNT(*) INTO book_count FROM libros WHERE author_id = author_id;
  RETURN book_count;
END;