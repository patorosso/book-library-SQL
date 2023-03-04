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







DROP FUNCTION IF EXISTS get_less_available_book_by_author;
DELIMITER //
CREATE FUNCTION get_less_available_book_by_author(id INT) RETURNS VARCHAR(70)
READS SQL DATA
BEGIN
DECLARE less_available_book VARCHAR(70);


SELECT titulo into less_available_book FROM libros WHERE id = id_autor AND (SELECT MIN(cant_disponible) FROM libros WHERE id_autor = id) limit 1;
RETURN less_available_book;
END //
DELIMITER ;

/* example */ 
SELECT get_less_available_book_by_author(4);
/* example */
