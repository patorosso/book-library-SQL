use library;
DROP FUNCTION IF EXISTS count_books_by_author;
DELIMITER //
CREATE FUNCTION count_books_by_author(id INT) RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE book_count INT;
  SELECT COUNT(*) INTO book_count FROM libros WHERE id = id_autor;
  RETURN book_count;
END //
DELIMITER ;

/* example */ 
SELECT count_books_by_author(4); 
/* example */

