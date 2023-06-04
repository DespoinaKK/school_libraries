--
-- Βάση δεδομένων: `school_libraries_128`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `author_book`
--

CREATE TABLE `author_book` (
  `ISBN` char(13) NOT NULL,
  `author_id` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `date_of_booking` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_user` int(11) DEFAULT NULL,
  `ISBN` char(13) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `books`
--

CREATE TABLE `books` (
  `title` varchar(80) NOT NULL,
  `publisher` varchar(40) NOT NULL,
  `ISBN` char(13) NOT NULL,
  `page_number` int(11) NOT NULL,
  `summary` varchar(3000) NOT NULL,
  `book_language` varchar(20) NOT NULL,
  `keywords` varchar(150) NOT NULL,
  `cover` varchar(20) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book_category`
--

CREATE TABLE `book_category` (
  `ISBN` char(13) NOT NULL,
  `category_id` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book_school`
--

CREATE TABLE `book_school` (
  `copies_available` int(11) DEFAULT NULL,
  `ISBN` char(13) NOT NULL,
  `school_id` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
);


-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `lending`
--

CREATE TABLE `lending` (
  `lending_id` int(11) NOT NULL,
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `ISBN` char(13) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL
);

--
-- Δείκτες `lending`
--
DELIMITER $$
CREATE TRIGGER `return_book` AFTER UPDATE ON `lending` FOR EACH ROW BEGIN
	UPDATE book_school
		SET copies_available = copies_available + 1
	WHERE ISBN = OLD.ISBN;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_copies` AFTER INSERT ON `lending` FOR EACH ROW BEGIN
	UPDATE book_school
		SET copies_available = copies_available - 1
		WHERE
		ISBN = NEW.ISBN;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pending_reviews`
--

CREATE TABLE `pending_reviews` (
  `review_id` int(11) NOT NULL,
  `star_review` int(11) NOT NULL,
  `review_text` varchar(500) DEFAULT NULL,
  `ISBN` char(13) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `star_review` int(11) NOT NULL,
  `review_text` varchar(500) DEFAULT NULL,
  `ISBN` char(13) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
);


-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `schools`
--

CREATE TABLE `schools` (
  `school_id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `director` varchar(70) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(40) NOT NULL,
  `post_code` char(5) NOT NULL,
  `telephone_number` char(10) NOT NULL,
  `email` varchar(50) NOT NULL
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1'
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users_unregistered`
--

CREATE TABLE `users_unregistered` (
  `id_user` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL
);

--
-- Ευρετήρια για πίνακα `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Ευρετήρια για πίνακα `author_book`
--
ALTER TABLE `author_book`
  ADD PRIMARY KEY (`ISBN`,`author_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Ευρετήρια για πίνακα `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `idx_booking_date` (`date_of_booking`);

--
-- Ευρετήρια για πίνακα `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`);

--
-- Ευρετήρια για πίνακα `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`ISBN`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Ευρετήρια για πίνακα `book_school`
--
ALTER TABLE `book_school`
  ADD PRIMARY KEY (`ISBN`,`school_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `idx_copies` (`copies_available`);

--
-- Ευρετήρια για πίνακα `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Ευρετήρια για πίνακα `lending`
--
ALTER TABLE `lending`
  ADD PRIMARY KEY (`lending_id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `idx_borrow_date` (`borrow_date`);

--
-- Ευρετήρια για πίνακα `pending_reviews`
--
ALTER TABLE `pending_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `id_user` (`id_user`);

--
-- Ευρετήρια για πίνακα `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `id_user` (`id_user`);

--
-- Ευρετήρια για πίνακα `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`school_id`);

--
-- Ευρετήρια για πίνακα `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_role` (`role`);

--
-- Ευρετήρια για πίνακα `users_unregistered`
--
ALTER TABLE `users_unregistered`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `school_id` (`school_id`);


--
-- AUTO_INCREMENT για πίνακα `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT για πίνακα `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT για πίνακα `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT για πίνακα `lending`
--
ALTER TABLE `lending`
  MODIFY `lending_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT για πίνακα `pending_reviews`
--
ALTER TABLE `pending_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT για πίνακα `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT για πίνακα `schools`
--
ALTER TABLE `schools`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT για πίνακα `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT για πίνακα `users_unregistered`
--
ALTER TABLE `users_unregistered`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


--
-- Περιορισμοί για πίνακα `author_book`
--
ALTER TABLE `author_book`
  ADD CONSTRAINT `author_book_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `author_book_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_book` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`),
  ADD CONSTRAINT `fk_booking_book` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking_sch` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking_us` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `book_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_book_cat` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `book_school`
--
ALTER TABLE `book_school`
  ADD CONSTRAINT `book_school_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `book_school_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`),
  ADD CONSTRAINT `fk_book_sch` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_school_bk` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`) ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `lending`
--
ALTER TABLE `lending`
  ADD CONSTRAINT `fk_lending_book` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lending_sch` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lending_us` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lending_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `lending_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `lending_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`);

--
-- Περιορισμοί για πίνακα `pending_reviews`
--
ALTER TABLE `pending_reviews`
  ADD CONSTRAINT `pending_reviews_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `pending_reviews_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Περιορισμοί για πίνακα `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_review_bk` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_review_us` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Περιορισμοί για πίνακα `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_school` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`);

--
-- Περιορισμοί για πίνακα `users_unregistered`
--
ALTER TABLE `users_unregistered`
  ADD CONSTRAINT `users_unregistered_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`);

