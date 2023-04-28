DELIMITER $$
CREATE TRIGGER `update_copies` AFTER INSERT ON `lending` FOR EACH ROW
BEGIN
	UPDATE book_school
		SET copies_available = copies_available - 1
		WHERE
		ISBN = NEW.ISBN;
END$$

CREATE TRIGGER `return_book` AFTER UPDATE ON `lending` FOR EACH ROW
BEGIN
	UPDATE book_school
		SET copies_available = copies_available + 1
	WHERE ISBN = OLD.ISBN;
END$$
DELIMITER ;



