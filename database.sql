-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 03, 2023 at 09:06 PM
-- Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE school_libraries_128;
USE school_libraries_128;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_libraries`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `name`) VALUES
(1, 'C.S. Lewis'),
(2, 'Roderick Beaton'),
(3, 'Aldous Huxley'),
(4, 'Harper Lee'),
(5, 'Paulo Coelho'),
(6, 'Jo Nesbo'),
(7, 'Agatha Christie'),
(8, 'Alexander Thompson'),
(9, 'Misha Glenny'),
(10, 'Charles Darwin'),
(11, 'Steven Runciman'),
(12, 'Thucydides'),
(13, 'Jane Austen'),
(14, 'Richard Dawkins'),
(15, 'Kostas Vlassopoulos'),
(16, 'Julian Barnes'),
(17, 'Thomas S. Kuhn'),
(18, 'Stieg Larsson'),
(19, 'Madeleine L \'Engle'),
(20, 'J.D. Salinger'),
(21, 'Carl Sagan'),
(22, 'Louis Sachar'),
(23, 'Brian Greene'),
(24, 'R.J. Palacio'),
(25, 'Simon Singh'),
(26, 'Dan Brown'),
(27, 'Jennifer Ackerman'),
(28, 'Frances Hodgson Burnett'),
(29, 'Suzanne Collins'),
(30, 'Philip Pullman'),
(31, 'George Orwell'),
(32, 'Oscar Wilde'),
(33, 'Richard Clogg'),
(34, 'John Green'),
(35, 'Lois Lowry'),
(36, 'J.R.R. Tolkien'),
(37, 'Stephen Hawking'),
(38, 'Nikos Kazantzakis'),
(39, 'James D. Watson'),
(40, 'F. Scott Fitzgerald'),
(41, 'J.K. Rowling'),
(42, 'Carlos Ruiz Zafon'),
(43, 'Rick Riordan'),
(44, 'Emily Adams'),
(45, 'Elizabeth Kolbert'),
(46, 'Craig Childs'),
(47, 'Sy Montgomery'),
(48, 'David Brewer'),
(49, 'Marc Bekoff'),
(50, 'Elena Ferrante'),
(51, 'Peter Wohlleben'),
(52, 'Rosamund Young'),
(53, 'Sofka Zinovieff'),
(54, 'Yanis Varoufakis'),
(55, 'Michael Llewellyn Smith'),
(56, 'Muriel Barbery'),
(57, 'Albert Camus'),
(58, 'Alain Damasio'),
(59, 'Victor Hugo'),
(60, 'Charles Baudelaire'),
(61, 'Antoine de Saint-Exupery'),
(62, 'Guy de Maupassant'),
(63, 'Choderlos de Laclos'),
(64, 'Michael Davis'),
(65, 'Sophia Johnson'),
(66, 'Alex Martinez'),
(67, 'Olivia Wilson'),
(68, 'David Thompson'),
(69, 'Isabella Anderson'),
(70, 'Matthew Harris'),
(71, 'Sophia Smith'),
(72, 'Katerina Gogou'),
(73, 'Dimitris Papadimitriou'),
(74, 'Vassilis Vassilikos'),
(75, 'Victoria Hislop'),
(76, 'Sophia Nikolaidou'),
(77, 'Kostas Skandalis'),
(78, 'Christos Georgiou'),
(79, 'Manolis Papagrigorakis'),
(80, 'Michalis Axenides'),
(81, 'Vassilis Koliatsos'),
(82, 'Konstantinos Dimas'),
(83, 'Nikos Papamichael'),
(84, 'Dimitrios Christodoulou'),
(86, 'jonathan'),
(87, 'J. K. Rowling'),
(88, 'anastasia');

-- --------------------------------------------------------

--
-- Table structure for table `author_book`
--

CREATE TABLE `author_book` (
  `ISBN` char(13) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author_book`
--

INSERT INTO `author_book` (`ISBN`, `author_id`) VALUES
('11111111111', 88),
('9780007117307', 1),
('9780007382161', 2),
('9780060850524', 3),
('9780061120084', 4),
('9780061122415', 5),
('9780062068422', 6),
('9780062073488', 7),
('9780062073556', 7),
('9780062073587', 7),
('9780062073617', 7),
('9780062073693', 7),
('9780062073778', 7),
('9780062693662', 7),
('9780064471046', 1),
('9780099546776', 6),
('9780099546790', 6),
('9780123456789', 8),
('9780140233773', 9),
('9780140439120', 10),
('9780140440119', 11),
('9780140440393', 12),
('9780141439518', 13),
('9780199291151', 14),
('9780199672776', 15),
('9780224094153', 16),
('9780226458083', 17),
('9780307269751', 18),
('9780307948687', 6),
('9780307960474', 6),
('9780307960498', 6),
('9780312367541', 19),
('9780316769488', 20),
('9780345409461', 21),
('9780345807090', 6),
('9780345807151', 6),
('9780374332662', 22),
('9780375708114', 23),
('9780375869020', 24),
('9780385495318', 25),
('9780385504201', 26),
('9780399563126', 27),
('9780435123653', 28),
('9780439023481', 29),
('9780440418320', 30),
('9780451524935', 31),
('9780451526342', 31),
('9780486278070', 32),
('9780521004794', 33),
('9780525432322', 6),
('9780525432483', 6),
('9780525478812', 34),
('9780544336261', 35),
('9780547928227', 36),
('9780553380163', 37),
('9780571207045', 38),
('9780571229214', 38),
('9780571321708', 38),
('9780571321715', 38),
('9780590406712', 28),
('9780684169964', 38),
('9780684803355', 39),
('9780684825546', 38),
('9780684834951', 38),
('9780684841263', 38),
('9780743273565', 40),
('9780747532743', 41),
('9780753820254', 42),
('9780786838653', 43),
('9781234567890', 44),
('9781250062185', 45),
('9781408855652', 87),
('9781416561111', 46),
('9781423106977', 43),
('9781451697728', 47),
('9781480437678', 48),
('9781577316493', 49),
('9781609450786', 50),
('9781771642484', 51),
('9781771643016', 52),
('9781781855869', 53),
('9781844675639', 48),
('9781846689953', 54),
('9781849048134', 38),
('9781904955768', 55),
('9781933372600', 56),
('9782070360024', 57),
('9782070360420', 57),
('9782070361878', 58),
('9782070401834', 59),
('9782070409274', 60),
('9782070612758', 61),
('9782253002381', 62),
('9782253004224', 63),
('9782345678901', 64),
('9783456789012', 65),
('9784567890123', 66),
('9785678901234', 67),
('9786789012345', 68),
('9787890123456', 69),
('9788901234567', 70),
('9789012345678', 71),
('9789600415584', 72),
('9789600419247', 73),
('9789600432437', 74),
('9789600432895', 75),
('9789601425009', 76),
('9789601660105', 77),
('9789601662741', 78),
('9789601663069', 79),
('9789603103397', 80),
('9789603991473', 81),
('9789603995044', 82),
('9789604062389', 83),
('9789604587546', 83),
('9789604587546', 84);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `date_of_booking` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_user` int(11) DEFAULT NULL,
  `ISBN` char(13) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `date_of_booking`, `id_user`, `ISBN`, `school_id`) VALUES
(6, '2023-05-31 10:20:43', 28, '9780684841263', 4),
(8, '2023-06-03 21:00:00', 6, '9780486278070', 1),
(9, '2023-05-31 21:00:00', 6, '9780062073693', 1),
(10, '2023-06-01 21:00:00', 4, '9780486278070', 1),
(11, '2023-05-31 21:00:00', 6, '9780062073693', 1),
(15, '2023-05-31 21:00:00', 4, '9780062073693', 1),
(16, '2023-06-01 21:00:00', 27, '9781234567890', 2),
(20, '2023-05-29 21:00:00', 46, '9780747532743', 2),
(21, '2023-05-31 21:00:00', 19, '9780753820254', 2),
(23, '2023-05-30 21:00:00', 45, '9780684825546', 2),
(24, '2023-05-30 21:00:00', 44, '9780684834951', 2),
(25, '2023-05-31 21:00:00', 13, '9780307960474', 3),
(26, '2023-05-31 21:00:00', 11, '9780226458083', 3),
(27, '2023-06-01 21:00:00', 15, '9780199672776', 3),
(31, '2023-05-29 21:00:00', 14, '9780140440393', 3),
(32, '2023-06-01 21:00:00', 31, '9789603991473', 4),
(34, '2023-06-01 21:00:00', 35, '9781933372600', 4),
(35, '2023-06-01 21:00:00', 55, '9782070612758', 4),
(36, '2023-05-30 21:00:00', 36, '9789601663069', 4),
(37, '2023-05-30 21:00:00', 30, '9782070409274', 4),
(38, '2023-05-31 21:00:00', 31, '9781849048134', 4);

-- --------------------------------------------------------

--
-- Table structure for table `books`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`title`, `publisher`, `ISBN`, `page_number`, `summary`, `book_language`, `keywords`, `cover`) VALUES
('hello', 'anastasia', '11111111111', 1111, 'good but not good', 'greek', 'very,good,chinese', '11111111111.jpg'),
('The Chronicles of Narnia', 'Geoffrey Bles', '9780007117307', 767, 'The Chronicles of Narnia is a series of seven fantasy novels set in the fictional world of Narnia. The books tell the story of a group of children who discover a magical wardrobe that leads them to a world filled with talking animals, mythical creatures, and epic battles between good and evil.', 'English', 'Fantasy, Adventure', '9780007117307.jpg'),
('Greece: Biography of a Modern Nation', 'Harper Perennial', '9780007382161', 704, 'A vivid and expansive history of Greece from its earliest days to the present.', 'English', 'Greek history, modern Greece, Greek culture', '9780007382161.jpg'),
('Brave New World', 'Chatto & Windus', '9780060850524', 288, 'The novel anticipates developments in reproductive technology, sleep-learning, psychological manipulation, and classical conditioning that are combined to make a dystopian society which is challenged by only a single individual: the storys protagonist.', 'English', 'Dystopian, Science fiction', '9780060850524.jpg'),
('To Kill a Mockingbird', 'J. B. Lippincott & Co.', '9780061120084', 281, 'The story takes place during three years of the Great Depression in the fictional \"tired old town\" of Maycomb, Alabama.', 'English', 'Classic, Social justice', '9780061120084.jpg'),
('The Alchemist', 'HarperCollins', '9780061122415', 208, 'The Alchemist follows the journey of an Andalusian shepherd boy named Santiago who dreams of discovering a treasure hidden in the Egyptian pyramids. Along the way, he meets a series of characters who teach him important lessons about life and love.', 'English', 'Fable, Quest', '9780061122415.jpg'),
('The Redbreast', 'Vintage Crime/Black Lizard', '9780062068422', 544, 'The Redbreast is the third novel featuring Harry Hole, and explores the connections between Norway \'s Nazi past and a series of murders. The novel was praised for its intricate plot and characterization.', 'English', 'Crime fiction, Detective, Norway', '9780062068422.jpg'),
('And Then There Were None', 'HarperCollins', '9780062073488', 272, 'A suspenseful murder mystery on an isolated island', 'English', 'Fiction, Mystery, Suspense', '9780062073488.jpg'),
('Death on the Nile', 'HarperCollins', '9780062073556', 352, 'A thrilling murder mystery set aboard a luxury cruise ship', 'English', 'Fiction, Mystery, Detective', '9780062073556.jpg'),
('The A.B.C. Murders', 'HarperCollins', '9780062073587', 256, 'A race against time to catch a serial killer', 'English', 'Fiction, Mystery, Detective', '9780062073587.jpg'),
('Murder at the Vicarage', 'HarperCollins', '9780062073617', 288, 'The first Miss Marple mystery novel', 'English', 'Fiction, Mystery, Detective', '9780062073617.jpg'),
('Five Little Pigs', 'HarperCollins', '9780062073693', 304, 'A cold case mystery involving a murder from the past', 'English', 'Fiction, Mystery, Detective', '9780062073693.jpg'),
('The Mousetrap', 'HarperCollins', '9780062073778', 128, 'A play by Agatha Christie, the longest-running in the world', 'English', 'Fiction, Mystery, Drama', '9780062073778.jpg'),
('Murder on the Orient Express', 'HarperCollins', '9780062693662', 256, 'A classic detective novel featuring Hercule Poirot', 'English', 'Fiction, Mystery, Detective', '9780062693662.jpg'),
('The Lion, the Witch and the Wardrobe', 'Geoffrey Bles', '9780064471046', 206, 'The Lion, the Witch and the Wardrobe is a classic fantasy novel about four siblings who discover a magical world called Narnia through a wardrobe in their home. The novel deals with themes of good versus evil, redemption, and sacrifice.', 'English', 'Children\'s literature, Fantasy, Christian literature', '9780064471046.jpg'),
('The Redeemer', 'Vintage Crime/Black Lizard', '9780099546776', 464, 'The Redeemer is the sixth novel featuring Harry Hole, and involves the investigation of a series of murders that appear to be linked to a Salvation Army mission in Oslo. The novel was praised for its atmospheric setting and its complex plot.', 'English', 'Crime fiction, Detective, Norway', '9780099546776.jpg'),
('The Leopard', 'Vintage Crime/Black Lizard', '9780099546790', 640, 'The Leopard is the eighth novel featuring Harry Hole, and involves the investigation of a series of murders that are linked to a notorious Norwegian serial killer. The novel was praised for its suspenseful plot and detailed characterization of Harry.', 'English', 'Crime fiction, Detective, Norway', '9780099546790.jpg'),
('Art and Society: A Cultural Perspective', 'Art & Culture Books', '9780123456789', 250, 'An interdisciplinary examination of the relationship between art and society', 'English', 'Art, Society, Cultural Studies', '9780123456789.jpg'),
('The Balkans: Nationalism, War and the Great Powers 1804-1999', 'Penguin Books', '9780140233773', 720, 'A comprehensive history of the Balkans, exploring the roots of nationalism and the conflicts that have plagued the region.', 'English', 'Balkan history, nationalism, Balkan wars', '9780140233773.jpg'),
('The Origin of Species', 'Penguin Classics', '9780140439120', 480, 'A book about the theory of evolution by natural selection, written by its founder and first proponent.', 'English', 'Evolution, Natural selection, Biology', '9780140439120.jpg'),
('The Fall of Constantinople 1453', 'Penguin Classics', '9780140440119', 400, 'A gripping account of the events that led to the fall of Constantinople to the Ottoman Turks.', 'English', 'Byzantine Empire, Ottoman Empire, history of Constantinople', '9780140440119.jpg'),
('The Peloponnesian War', 'Penguin Classics', '9780140440393', 648, 'An account of the war between Athens and Sparta in the 5th century BC.', 'English', 'Ancient Greece, Peloponnesian War, Athenian Empire', '9780140440393.jpg'),
('Pride and Prejudice', 'T. Egerton, Whitehall', '9780141439518', 279, 'The novel follows the character development of Elizabeth Bennet, the dynamic protagonist of the book, who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness.', 'English', 'Classic, Romance, Society', '9780141439518.jpg'),
('The Selfish Gene', 'Oxford University Press', '9780199291151', 384, 'A book about the evolution of biological life, with a focus on the role of genes in the process of natural selection.', 'English', 'Evolution, Genetics, Biology', '9780199291151.jpg'),
('The Greeks: A Portrait of Self and Others', 'Oxford University Press', '9780199672776', 304, 'Explores the ways in which ancient Greeks thought about themselves and their relationship to others.', 'English', 'Ancient Greece, Greek culture, Greek society', '9780199672776.jpg'),
('The Sense of an Ending', 'Jonathan Cape', '9780224094153', 150, 'The Sense of an Ending is a novel about memory, regret, and the nature of truth. The story follows retired divorcee Tony Webster as he reflects on his life and the events that led to a tragic incident in his youth. The book won the Man Booker Prize in 2011.', 'English', 'Fiction, Memory, Truth, England', '9780224094153.jpg'),
('The Structure of Scientific Revolutions', 'University of Chicago Press', '9780226458083', 212, 'A book about the history and philosophy of science, with a focus on the role of paradigm shifts in scientific progress.', 'English', 'Philosophy of science, History of science, Scientific progress', '9780226458083.jpg'),
('The Girl with the Dragon Tattoo', 'Norstedts Förlag', '9780307269751', 600, 'The novel tells the story of Mikael Blomkvist, a journalist who is hired to investigate the disappearance of a wealthy businessman\'s niece, and Lisbeth Salander, a brilliant but troubled computer hacker who helps him with the investigation.', 'Swedish', 'Mystery, Thriller', '9780307269751.jpg'),
('Headhunters', 'Vintage Crime/Black Lizard', '9780307948687', 288, 'Headhunters is a standalone novel by Jo Nesbø that follows the story of Roger Brown, a successful headhunter who is also an art thief. When he tries to steal a valuable painting from one of his clients, he gets more than he bargained for. The novel was praised for its fast-paced plot and its memorable protagonist.', 'English', 'Suspense fiction, Art theft, Norway', '9780307948687.jpg'),
('The Son', 'Vintage Crime/Black Lizard', '9780307960474', 400, 'The Son is a standalone novel by Jo Nesbø that follows the story of a young man who is serving time in prison for crimes he did not commit. When he is released, he sets out to find the people who set him up and clear his name. The novel was praised for its suspenseful plot and its exploration of themes like justice and revenge.', 'English', 'Suspense fiction, Norway', '9780307960474.jpg'),
('Police', 'Vintage Crime/Black Lizard', '9780307960498', 640, 'Police is the tenth novel featuring Harry Hole, and deals with a series of killings that appear to be linked to a case that Harry investigated years ago. The novel was praised for its dark and twisty plot and the return of some beloved characters from the series.', 'English', 'Crime fiction, Detective, Norway', '9780307960498.jpg'),
('A Wrinkle in Time', 'Farrar, Straus and Giroux', '9780312367541', 211, 'A Wrinkle in Time is a science fantasy novel about a young girl named Meg Murry who travels through space and time to save her father from a malevolent force. The novel deals with themes of family, love, and the power of good over evil.', 'English', 'Children\'s literature, Science fantasy, Time travel, Family', '9780312367541.jpg'),
('The Catcher in the Rye', 'Little, Brown and Company', '9780316769488', 224, 'The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school.', 'English', 'Coming-of-age, Society', '9780316769488.jpg'),
('The Demon-Haunted World', 'Ballantine Books', '9780345409461', 480, 'A book about the scientific method and the importance of critical thinking in a world of pseudoscience and superstition.', 'English', 'Science, Critical thinking, Skepticism', '9780345409461.jpg'),
('The Bat', 'Vintage Crime/Black Lizard', '9780345807090', 384, 'The Bat is the first novel featuring Harry Hole, and takes place in Australia, where Harry is sent to investigate the murder of a Norwegian citizen. The novel explores themes of culture clash and identity.', 'English', 'Crime fiction, Detective, Australia', '9780345807090.jpg'),
('Phantom', 'Vintage Crime/Black Lizard', '9780345807151', 496, 'Phantom is the ninth novel featuring Harry Hole, and deals with the aftermath of a bank robbery in Oslo. The novel was praised for its complex plot and the development of Harry\'s character.', 'English', 'Crime fiction, Detective, Norway', '9780345807151.jpg'),
('Holes', 'Farrar, Straus and Giroux', '9780374332662', 233, 'Holes is a mystery novel about a boy named Stanley who is sent to a juvenile detention center where he and his fellow inmates are forced to dig holes in the desert. As he digs, Stanley uncovers the truth about the center and his family\'s past. The novel deals with themes of family, friendship, and justice.', 'English', 'Children\'s literature, Mystery, Adventure, Justice', '9780374332662.jpg'),
('The Elegant Universe', 'Vintage Books', '9780375708114', 448, 'A book about the history of physics, from classical mechanics to string theory and beyond.', 'English', 'Physics, String theory, Cosmology', '9780375708114.jpg'),
('Wonder', 'Knopf Books for Young Readers', '9780375869020', 316, 'Wonder is a novel about a young boy named August who has a facial deformity and starts attending public school for the first time. The novel deals with themes of kindness, empathy, and acceptance.', 'English', 'Children\'s literature, Realistic fiction, Bullying, Disability', '9780375869020.jpg'),
('The Code Book', 'Doubleday', '9780385495318', 432, 'A book about the history and science of cryptography, from ancient times to the present day.', 'English', 'Cryptography, History of science, Computer science', '9780385495318.jpg'),
('The Da Vinci Code', 'Doubleday', '9780385504201', 454, 'The novel follows symbologist Robert Langdon and cryptologist Sophie Neveu as they investigate a murder in the Louvre Museum in Paris, and discover a trail of clues that lead them to a secret society and a religious mystery that could shake the foundations of Christianity.', 'English', 'Mystery, Thriller', '9780385504201.jpg'),
('The Genius of Birds', 'Penguin Books', '9780399563126', 352, 'An engaging and insightful look at the intelligence and adaptability of birds.', 'English', 'Birds, animal behavior, bird intelligence', '9780399563126.jpg'),
('The Secret Garden', 'Heinemann', '9780435123653', 263, 'The Secret Garden is a children\'s novel about a young girl named Mary who moves to her uncle\'s estate in England and discovers a hidden garden that has been locked up for years. The novel deals with themes of friendship, nature, and the power of positive thinking.', 'English', 'Children\'s literature, Friendship, Nature, Positive thinking', '9780435123653.jpg'),
('The Hunger Games', 'Scholastic Press', '9780439023481', 374, 'The Hunger Games is set in a post-apocalyptic dystopian world where the Capitol, a wealthy and technologically advanced city, holds power over the rest of the nation. Each year, the Capitol holds the Hunger Games, a televised event where one boy and one girl from each of the 12 districts must fight to the death.', 'English', 'Dystopian, Action', '9780439023481.jpg'),
('The Golden Compass', 'Knopf Books for Young Readers', '9780440418320', 399, 'The Golden Compass is a fantasy novel about a young girl named Lyra who embarks on a dangerous journey to save her friend and uncover the truth about a mysterious substance called Dust. The novel deals with themes of religion, freedom, and the power of knowledge.', 'English', 'Children\'s literature, Fantasy, Adventure, Religion', '9780440418320.jpg'),
('1984', 'Secker and Warburg', '9780451524935', 328, 'The story takes place in an imagined future, the year 1984, when much of the world has fallen victim to perpetual war, omnipresent government surveillance, historical negationism, and propaganda.', 'English', 'Dystopian, Political fiction', '9780451524935.jpg'),
('Animal Farm', 'Secker and Warburg', '9780451526342', 112, 'The novel tells the story of a group of farm animals who rebel against their human farmer, hoping to create a society where the animals can be equal, free, and happy.', 'English', 'Political satire, Allegory', '9780451526342.jpg'),
('The Picture of Dorian Gray', 'Lippincott\'s Monthly Magazine', '9780486278070', 254, 'The novel tells the story of a young man named Dorian Gray who becomes obsessed with his own beauty and youth. He sells his soul to the devil in exchange for eternal youth, and his portrait ages instead of him. As he becomes more and more corrupt, the portrait becomes more and more grotesque.', 'English', 'Gothic, Horror', '9780486278070.jpg'),
('A Concise History of Greece', 'Cambridge University Press', '9780521004794', 320, 'A comprehensive history of Greece from ancient times to the present day.', 'English', 'Greek history, ancient Greece, modern Greece', '9780521004794.jpg'),
('The Thirst', 'Vintage Crime/Black Lizard', '9780525432322', 544, 'The Thirst is the eleventh novel featuring Harry Hole, and deals with a series of murders that appear to be connected to the vampire mythology. The novel was praised for its twists and the return of some familiar characters from the series.', 'English', 'Crime fiction, Detective, Norway', '9780525432322.jpg'),
('The Snowman', 'Vintage Crime/Black Lizard', '9780525432483', 464, 'The Snowman is a crime novel featuring the Norwegian detective Harry Hole. In this novel, Harry investigates a series of murders that are connected to the appearance of a snowman at the crime scenes. The novel was a bestseller and has been adapted into a film.', 'English', 'Crime fiction, Detective, Norway', '9780525432483.jpg'),
('The Fault in Our Stars', 'Dutton Books', '9780525478812', 313, 'The Fault in Our Stars is a love story between two teenagers with cancer, Hazel and Gus. Despite the challenges they face, they find love and hope in each other, and embark on a journey to Amsterdam to meet their favorite author.', 'English', 'Romance, Drama', '9780525478812.jpg'),
('The Giver', 'Houghton Mifflin', '9780544336261', 225, 'The Giver is a dystopian novel about a boy named Jonas who lives in a seemingly perfect society where everything is controlled by the government. When he is chosen to be the Receiver of Memory, he begins to question the morality of his society. The novel deals with themes of individuality, freedom, and the value of memories.', 'English', 'Children\'s literature, Dystopian fiction, Science fiction, Individuality', '9780544336261.jpg'),
('The Hobbit', 'George Allen & Unwin', '9780547928227', 310, 'The story is set in a world filled with magical creatures and tells the tale of a hobbit named Bilbo Baggins who is recruited by a wizard named Gandalf to help a group of dwarves reclaim their home and treasure from a dragon.', 'English', 'Fantasy, Adventure', '9780547928227.jpg'),
('A Brief History of Time', 'Bantam Books', '9780553380163', 212, 'An introduction to cosmology and the history of the universe, written for the layperson.', 'English', 'Cosmology, Physics, Astronomy', '9780553380163.jpg'),
('The Greek Passion', 'Faber & Faber', '9780571207045', 448, 'A novel about a Greek village that takes in refugees from a nearby town, leading to a conflict between the villagers and the refugees.', 'Greek', 'Fiction, Social Commentary, Philosophy', '9780571207045.jpg'),
('Report to Greco', 'Faber & Faber', '9780571229214', 576, 'An autobiographical novel that explores the author\'s personal and philosophical journey.', 'Greek', 'Autobiography, Philosophy, Religion', '9780571229214.jpg'),
('Christ Recrucified', 'Faber & Faber', '9780571321708', 496, 'Christ Recrucified is a novel that tells the story of a small Greek village that stages a Passion Play. The book explores themes of faith, sacrifice, and the human condition, and is considered one of Kazantzakis\'s masterpieces.', 'Greek', 'Fiction, Religion', '9780571321708.jpg'),
('The Last Temptation', 'Faber & Faber', '9780571321715', 608, 'The Last Temptation is a novel that reimagines the life of Jesus Christ. The book explores themes of faith, doubt, and the nature of sacrifice, and caused controversy upon its publication due to its controversial portrayal of Christ.', 'Greek', 'Fiction, Religion', '9780571321715.jpg'),
('The Secret Garden', 'Heinemann', '9780590406712', 358, 'The Secret Garden is a classic children\'s novel about a young girl named Mary who discovers a hidden garden on her uncle\'s estate and befriends a sickly boy named Colin. The novel deals with themes of nature, friendship, and healing.', 'English', 'Children\'s literature, Realistic fiction, Friendship, Nature', '9780590406712.jpg'),
('The Odyssey: A Modern Sequel', 'Simon & Schuster', '9780684169964', 928, 'A poetic epic that continues the story of Odysseus after his return to Ithaca.', 'Greek', 'Poetry, Epic, Mythology', '9780684169964.jpg'),
('The Double Helix', 'Scribner', '9780684803355', 256, 'A memoir about the discovery of the structure of DNA, written by one of its co-discoverers.', 'English', 'DNA, Genetics, Memoir', '9780684803355.jpg'),
('Zorba the Greek', 'Simon & Schuster', '9780684825546', 320, 'A novel about the friendship between a young intellectual and a passionate Greek peasant named Zorba.', 'Greek', 'Fiction, Philosophy, Friendship', '9780684825546.jpg'),
('The Saviors of God: Spiritual Exercises', 'Simon & Schuster', '9780684834951', 256, 'A philosophical and spiritual exploration of the author\'s beliefs and values.', 'Greek', 'Philosophy, Spirituality, Religion', '9780684834951.jpg'),
('Saint Francis', 'Simon & Schuster', '9780684841263', 384, 'A novel about the life of Saint Francis of Assisi, told in a lyrical and imaginative style.', 'Greek', 'Fiction, Religion, Biography', '9780684841263.jpg'),
('The Great Gatsby', 'Scribner', '9780743273565', 180, 'The story primarily concerns the young and mysterious millionaire Jay Gatsby and his quixotic passion and obsession with the beautiful former debutante Daisy Buchanan. ', 'English', 'Classic, Romance', '9780743273565.jpg'),
('Harry Potter and the Philosopher\'s Stone', 'Bloomsbury Publishing', '9780747532743', 223, 'Harry Potter has been living a miserable life with his Aunt Petunia and Uncle Vernon. ', 'English', 'Fantasy, Magic', '9780747532743.jpg'),
('The Shadow of the Wind', 'Weidenfeld & Nicolson', '9780753820254', 512, 'The Shadow of the Wind is a gothic novel set in Barcelona in the aftermath of the Spanish Civil War. The story follows young Daniel Sempere as he becomes obsessed with a mysterious book and its enigmatic author. The book has been translated into many languages and is considered a modern classic.', 'English', 'Fiction, Spain, Gothic', '9780753820254.jpg'),
('Percy Jackson and the Lightning Thief', 'Disney Hyperion Books', '9780786838653', 377, 'Percy Jackson and the Lightning Thief is a fantasy adventure novel about a young boy named Percy Jackson who discovers he is a demigod and embarks on a quest to retrieve Zeus\'s stolen lightning bolt. The novel deals with themes of identity, friendship, and mythology.', 'English', 'Children\'s literature, Fantasy, Adventure, Mythology', '9780786838653.jpg'),
('The Art of Impressionism', 'Art Books Inc.', '9781234567890', 200, 'An in-depth exploration of the Impressionist art movement', 'English', 'Art, Impressionism, Painting', '9781234567890.jpg'),
('The Sixth Extinction: An Unnatural History', 'Picador', '9781250062185', 336, 'A sobering look at the mass extinctions happening on our planet and the role humans are playing in them.', 'English', 'Extinction, environmentalism, conservation', '9781250062185.jpg'),
('Harry Potter and the Philosopher\'s Stone', 'Bloomsbury Publishing PLC', '9781408855652', 352, 'Boy discovers magic powers goes to wizard school and fights evil wizard', 'English', 'Fantasy,England,Action', '9781408855652.jpg'),
('The Animal Dialogues: Uncommon Encounters in the Wild', 'Scribner', '9781416561111', 288, 'A collection of essays that explore the author\'s experiences with wild animals, from grizzly bears to mountain lions.', 'English', 'Wild animals, nature, animal behavior', '9781416561111.jpg'),
('Percy Jackson and The Lightning Thief', 'Disney Hyperion', '9781423106977', 375, 'Percy Jackson and The Lightning Thief is a fantasy adventure novel about a young boy named Percy who discovers he is the son of Poseidon, the Greek god of the sea. He goes on a quest to retrieve Zeus\'s stolen lightning bolt and clear his name. The novel deals with themes of Greek mythology, friendship, and bravery.', 'English', 'Children\'s literature, Fantasy, Adventure, Greek mythology', '9781423106977.jpg'),
('The Soul of an Octopus', 'Atria Books', '9781451697728', 272, 'A lyrical meditation on the nature of consciousness and the complex inner lives of these fascinating creatures.', 'English', 'Octopus, animal consciousness, marine biology', '9781451697728.jpg'),
('The Greek War of Independence: The Struggle for Freedom from Ottoman Oppression', 'Open Road Media', '9781480437678', 576, 'The Greek War of Independence is a comprehensive history of the Greek Revolution against Ottoman rule in the early 19th century. The book explores the political, social, and cultural factors that led to the rebellion, and the impact it had on Greece and the wider world.', 'English', 'History, Greece', '9781480437678.jpg'),
('The Emotional Lives of Animals', 'New World Library', '9781577316493', 256, 'An exploration of the rich emotional lives of animals, from joy and grief to anger and love.', 'English', 'Animal emotions, animal behavior, animal cognition', '9781577316493.jpg'),
('My Brilliant Friend', 'Europa Editions', '9781609450786', 336, 'My Brilliant Friend is a coming-of-age novel set in Naples, Italy. The story follows the lives of two young girls, Elena and Lila, as they grow up in a poor neighborhood and navigate the complexities of friendship, family, and education. The book is the first in a series of four novels.', 'English', 'Fiction, Italy, Coming-of-Age', '9781609450786.jpg'),
('The Hidden Life of Trees', 'Greystone Books', '9781771642484', 288, 'A fascinating exploration of the complex social networks and communication systems of trees.', 'English', 'Trees, forests, nature', '9781771642484.jpg'),
('The Secret Life of Cows', 'Greystone Books', '9781771643016', 160, 'A charming and intimate portrait of cows and their complex social lives, based on years of observation on a farm in England.', 'English', 'Cows, animal behavior, animal cognition', '9781771643016.jpg'),
('The House on Paradise Street', 'Head of Zeus', '9781781855869', 368, 'The House on Paradise Street is a novel set in Athens during the Second World War and the Greek Civil War. The novel follows the story of a young woman who becomes involved with the resistance movement and must navigate the dangerous political landscape of the time. The novel deals with themes of love, betrayal, and survival.', 'English', 'Historical fiction, War fiction, Resistance, Greece', '9781781855869.jpg'),
('The Greek Revolution: 1821 and the Freedom of the Nation', 'Verso', '9781844675639', 400, 'A history of the Greek War of Independence and its impact on the country and the wider world.', 'English', 'Greek War of Independence, Greek revolution, Ottoman Empire', '9781844675639.jpg'),
('Austerity Measures', 'Serpent\'s Tail', '9781846689953', 320, 'Austerity Measures is a collection of essays by Yanis Varoufakis, the former finance minister of Greece. The book offers a critical analysis of the European Union\'s response to the Greek debt crisis, and argues for an alternative approach to economics and politics.', 'Greek', 'Politics, Economics', '9781846689953.jpg'),
('Toda Raba', 'C. Hurst & Co.', '9781849048134', 120, 'A collection of essays, poems, and letters that express the author\'s ideas and beliefs about life, art, and spirituality.', 'Greek', 'Essays, Poetry, Letters', '9781849048134.jpg'),
('Athens: A Cultural and Literary History', 'Signal Books', '9781904955768', 256, 'Explores the cultural and literary history of Athens, from ancient times to the present day.', 'English', 'Athens history, Greek literature, Greek culture', '9781904955768.jpg'),
('The Elegance of the Hedgehog', 'Europa Editions', '9781933372600', 336, 'The Elegance of the Hedgehog is a philosophical novel set in an apartment building in Paris. The story follows the lives of two unlikely friends, a precocious twelve-year-old girl and a reclusive concierge, as they contemplate the meaning of life and death. The book has been translated into many languages and was a bestseller in France.', 'English', 'Fiction, Philosophy, France', '9781933372600.jpg'),
('L\'étranger', 'Gallimard', '9782070360024', 123, 'A novel about the indifference of man towards life and death, told through the eyes of Meursault, a detached and apathetic character.', 'French', 'Novel, Philosophy, Existentialism', '9782070360024.jpg'),
('La Peste', 'Gallimard', '9782070360420', 320, 'A novel about a plague epidemic that strikes the city of Oran, Algeria, and the reactions of the inhabitants to death and suffering.', 'French', 'Novel, Philosophy, Existentialism', '9782070360420.jpg'),
('La Horde du Contrevent', 'Gallimard', '9782070361878', 656, 'A science-fiction novel about the adventures of a team of wind hunters, who try to reach the origin of the winds to discover the secret of their existence.', 'French', 'Science-fiction novel, Adventure, Philosophy', '9782070361878.jpg'),
('Les Misérables', 'Gallimard', '9782070401834', 1952, 'A historical novel about the life of Jean Valjean, a former convict who tries to redeem himself and help others, despite the oppression and poverty that surround him.', 'French', 'Historical novel, French literature, Poverty', '9782070401834.jpg'),
('Les Fleurs du Mal', 'Gallimard', '9782070409274', 448, 'A collection of dark and sensual poems that explore the themes of love, death, and modernity.', 'French', 'Poetry, French literature, Spleen', '9782070409274.jpg'),
('Le Petit Prince', 'Gallimard', '9782070612758', 96, 'A poetic tale about friendship and life, told through the adventures of a little prince from another planet.', 'French', 'Tale, Philosophy, Friendship', '9782070612758.jpg'),
('Bel-Ami', 'Le Livre de Poche', '9782253002381', 304, 'A novel about the social ascent of Georges Duroy, an ambitious and seductive young man, in the Paris of the late 19th century.', 'French', 'Novel, French literature, Ambition', '9782253002381.jpg'),
('Les Liaisons dangereuses', 'Le Livre de Poche', '9782253004224', 544, 'An epistolary novel about the games of seduction and power between two French aristocrats, the Marquise de Merteuil and the Vicomte de Valmont.', 'French', 'Epistolary novel, French literature, Seduction', '9782253004224.jpg'),
('Contemporary Art: A Visual Journey', 'Art Publishers Ltd.', '9782345678901', 180, 'A comprehensive survey of contemporary art from around the world', 'English', 'Art, Contemporary Art, Art History', '9782345678901.jpg'),
('The Lives of the Artists', 'Art & Culture Press', '9783456789012', 350, 'Biographies of famous artists throughout history', 'English', 'Art, Artists, Biographies', '9783456789012.jpg'),
('The Art of Photography', 'Photography Books Ltd.', '9784567890123', 150, 'A guide to mastering the art of photography', 'English', 'Art, Photography, Camera Techniques', '9784567890123.jpg'),
('Art Nouveau: A Style for the Modern Age', 'Art Publishers Inc.', '9785678901234', 220, 'An exploration of the Art Nouveau movement in design and architecture', 'English', 'Art, Art Nouveau, Design', '9785678901234.jpg'),
('Abstract Art: Exploring the Boundaries', 'Abstract Art Press', '9786789012345', 280, 'A comprehensive study of abstract art and its evolution', 'English', 'Art, Abstract Art, Art History', '9786789012345.jpg'),
('Renaissance Art: The Age of Enlightenment', 'Art Books Ltd.', '9787890123456', 300, 'A detailed examination of the art and culture of the Renaissance period', 'English', 'Art, Renaissance Art, European Art', '9787890123456.jpg'),
('Sculpture: From Classical to Contemporary', 'Sculpture Publications', '9788901234567', 230, 'An overview of the history and techniques of sculpture', 'English', 'Art, Sculpture, Art History', '9788901234567.jpg'),
('The Art of Color Theory', 'Art Color Press', '9789012345678', 180, 'An exploration of color theory in art and design', 'English', 'Art, Color Theory, Design', '9789012345678.jpg'),
('The Last Word', 'Kedros', '9789600415584', 150, 'The Last Word is a collection of short stories by Katerina Gogou, a prominent figure in the Greek counterculture movement. The stories are dark and gritty, and deal with themes of poverty, addiction, and social injustice. The collection is considered a classic of modern Greek literature.', 'Greek', 'Short stories, Counterculture, Social realism', '9789600415584.jpg'),
('The Return', 'Kedros', '9789600419247', 265, 'The Return is a novel that explores the lives of a group of Greek immigrants living in Germany. The novel follows the story of a young woman who returns to Greece to search for her missing father. The novel deals with themes of identity, culture, and the immigrant experience.', 'Greek', 'Contemporary fiction, Immigrant literature', '9789600419247.jpg'),
('Z', 'Kedros', '9789600432437', 250, 'Z is a political novel set in Greece during the 1960s and follows the investigation of a murder of a left-wing activist. The novel explores themes of political corruption and the abuse of power. It was adapted into an Oscar-nominated film directed by Costa-Gavras.', 'Greek', 'Political fiction, Historical fiction, Film adaptation', '9789600432437.jpg'),
('The Island', 'Kedros', '9789600432895', 472, 'The Island is a novel set on the Greek island of Spinalonga, which was once a leper colony. The novel follows the story of a young woman who discovers her familys connection to the island and its inhabitants. The novel has been translated into over 25 languages and was adapted into a television series.', 'Greek', 'Historical fiction, Romance, Family saga, Television adaptation', '9789600432895.jpg'),
('The Scapegoat', 'Ypsilon', '9789601425009', 384, 'The Scapegoat is a contemporary novel set in Athens during the Greek economic crisis. The story follows the lives of three characters whose paths intersect as they struggle to survive in a society that is collapsing around them.', 'Greek', 'Contemporary, Economic Crisis', '9789601425009.jpg'),
('Electromagnetism', 'Patakis Publishers', '9789601660105', 448, 'A textbook on electromagnetism, covering the theory and applications of electromagnetic fields and waves.', 'Greek', 'Physics, Electromagnetism, Electrical engineering', '9789601660105.jpg'),
('Cosmogony: The Birth of the Universe', 'Patakis Publishers', '9789601662741', 320, 'A book on the origin and evolution of the universe, covering topics such as the big bang, cosmic inflation, and dark matter.', 'Greek', 'Cosmology, Astronomy, Astrophysics', '9789601662741.jpg'),
('The Brain', 'Patakis Publishers', '9789601663069', 352, 'A book on the structure and function of the brain, covering topics such as neuroplasticity, memory, and consciousness.', 'Greek', 'Neuroscience, Brain, Psychology', '9789601663069.jpg'),
('The Quantum Theory of Fields', 'Themelio Publications', '9789603103397', 640, 'A textbook on the quantum theory of fields, covering topics such as gauge theories, renormalization, and the Higgs mechanism.', 'Greek', 'Physics, Quantum field theory, Particle physics', '9789603103397.jpg'),
('Anatomy of the Nervous System', 'Paschalidis Medical Publications', '9789603991473', 472, 'A comprehensive textbook on the anatomy and physiology of the nervous system, including the brain, spinal cord, and peripheral nerves.', 'Greek', 'Neuroscience, Anatomy, Physiology', '9789603991473.jpg'),
('Biochemistry and Pathobiochemistry', 'Paschalidis Medical Publications', '9789603995044', 532, 'A textbook on biochemistry and pathobiochemistry, covering topics such as metabolism, enzymes, and cellular signaling.', 'Greek', 'Biochemistry, Pathology, Molecular biology', '9789603995044.jpg'),
('Elementary Differential Equations', 'Ellinika Grammata', '9789604062389', 480, 'A textbook on differential equations, covering topics such as first-order equations, linear equations, and Laplace transforms.', 'Greek', 'Mathematics, Differential equations, Calculus', '9789604062389.jpg'),
('General Relativity and Cosmology', 'Papazisi Publishers', '9789604587546', 576, 'A textbook on general relativity and cosmology, covering topics such as black holes, gravitational waves, and the expanding universe.', 'Greek', 'Physics, General relativity, Cosmology', '9789604587546.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `ISBN` char(13) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`ISBN`, `category_id`) VALUES
('11111111111', 1),
('11111111111', 2),
('11111111111', 19),
('11111111111', 23),
('9780007117307', 4),
('9780007117307', 6),
('9780007117307', 12),
('9780007382161', 1),
('9780007382161', 2),
('9780007382161', 3),
('9780060850524', 5),
('9780061120084', 1),
('9780061122415', 7),
('9780061122415', 12),
('9780062068422', 5),
('9780062073488', 4),
('9780062073488', 5),
('9780062073556', 4),
('9780062073556', 5),
('9780062073587', 4),
('9780062073587', 5),
('9780062073617', 4),
('9780062073617', 5),
('9780062073693', 4),
('9780062073693', 5),
('9780062073693', 14),
('9780062073778', 4),
('9780062073778', 7),
('9780062693662', 4),
('9780062693662', 5),
('9780064471046', 12),
('9780064471046', 16),
('9780064471046', 19),
('9780099546776', 4),
('9780099546776', 5),
('9780099546790', 4),
('9780099546790', 5),
('9780123456789', 1),
('9780140233773', 1),
('9780140233773', 2),
('9780140233773', 3),
('9780140439120', 3),
('9780140440119', 1),
('9780140440119', 2),
('9780140440119', 3),
('9780140440393', 1),
('9780140440393', 2),
('9780140440393', 3),
('9780141439518', 4),
('9780199291151', 3),
('9780199672776', 1),
('9780199672776', 2),
('9780199672776', 3),
('9780224094153', 1),
('9780224094153', 2),
('9780224094153', 4),
('9780224094153', 5),
('9780226458083', 3),
('9780307269751', 5),
('9780307269751', 10),
('9780307948687', 4),
('9780307948687', 5),
('9780307948687', 7),
('9780307948687', 8),
('9780307960474', 4),
('9780307960474', 7),
('9780307960498', 4),
('9780307960498', 5),
('9780312367541', 4),
('9780312367541', 5),
('9780316769488', 4),
('9780345409461', 3),
('9780345807090', 5),
('9780345807151', 5),
('9780374332662', 4),
('9780374332662', 5),
('9780375708114', 3),
('9780375869020', 7),
('9780375869020', 19),
('9780385495318', 3),
('9780385504201', 5),
('9780385504201', 15),
('9780399563126', 3),
('9780399563126', 17),
('9780435123653', 4),
('9780435123653', 6),
('9780439023481', 4),
('9780439023481', 12),
('9780440418320', 4),
('9780440418320', 12),
('9780440418320', 13),
('9780451524935', 5),
('9780451526342', 5),
('9780486278070', 4),
('9780486278070', 16),
('9780486278070', 19),
('9780521004794', 1),
('9780521004794', 2),
('9780521004794', 3),
('9780525432322', 5),
('9780525432483', 5),
('9780525478812', 11),
('9780525478812', 20),
('9780544336261', 3),
('9780544336261', 4),
('9780544336261', 5),
('9780544336261', 9),
('9780544336261', 11),
('9780544336261', 12),
('9780544336261', 19),
('9780547928227', 13),
('9780553380163', 1),
('9780571207045', 1),
('9780571207045', 4),
('9780571207045', 6),
('9780571207045', 7),
('9780571207045', 8),
('9780571207045', 13),
('9780571207045', 15),
('9780571229214', 1),
('9780571229214', 3),
('9780571229214', 10),
('9780571229214', 12),
('9780571229214', 14),
('9780571229214', 18),
('9780571229214', 20),
('9780571321708', 11),
('9780571321708', 15),
('9780571321715', 11),
('9780571321715', 15),
('9780590406712', 12),
('9780590406712', 19),
('9780684169964', 1),
('9780684169964', 2),
('9780684169964', 3),
('9780684169964', 4),
('9780684169964', 5),
('9780684169964', 11),
('9780684169964', 19),
('9780684803355', 3),
('9780684825546', 2),
('9780684825546', 4),
('9780684825546', 6),
('9780684825546', 10),
('9780684825546', 12),
('9780684825546', 16),
('9780684825546', 18),
('9780684834951', 5),
('9780684834951', 7),
('9780684834951', 8),
('9780684834951', 9),
('9780684834951', 14),
('9780684834951', 17),
('9780684834951', 20),
('9780684841263', 2),
('9780684841263', 4),
('9780684841263', 5),
('9780684841263', 7),
('9780684841263', 9),
('9780684841263', 13),
('9780684841263', 20),
('9780743273565', 4),
('9780747532743', 13),
('9780753820254', 1),
('9780753820254', 2),
('9780753820254', 4),
('9780753820254', 5),
('9780786838653', 9),
('9780786838653', 12),
('9780786838653', 19),
('9781234567890', 9),
('9781250062185', 1),
('9781250062185', 3),
('9781408855652', 4),
('9781408855652', 12),
('9781416561111', 3),
('9781416561111', 6),
('9781423106977', 4),
('9781423106977', 12),
('9781451697728', 3),
('9781451697728', 15),
('9781480437678', 1),
('9781480437678', 4),
('9781480437678', 5),
('9781577316493', 3),
('9781577316493', 15),
('9781609450786', 1),
('9781609450786', 2),
('9781609450786', 4),
('9781609450786', 5),
('9781771642484', 3),
('9781771642484', 6),
('9781771643016', 3),
('9781771643016', 15),
('9781781855869', 1),
('9781781855869', 5),
('9781781855869', 15),
('9781844675639', 1),
('9781844675639', 2),
('9781844675639', 3),
('9781846689953', 1),
('9781846689953', 7),
('9781849048134', 3),
('9781849048134', 11),
('9781849048134', 12),
('9781849048134', 15),
('9781849048134', 16),
('9781849048134', 17),
('9781849048134', 19),
('9781904955768', 1),
('9781904955768', 2),
('9781904955768', 3),
('9781933372600', 1),
('9781933372600', 2),
('9781933372600', 4),
('9781933372600', 5),
('9782070360024', 4),
('9782070360420', 4),
('9782070361878', 1),
('9782070401834', 1),
('9782070409274', 7),
('9782070612758', 4),
('9782253002381', 4),
('9782253004224', 4),
('9782345678901', 9),
('9783456789012', 2),
('9784567890123', 9),
('9785678901234', 1),
('9786789012345', 1),
('9787890123456', 1),
('9788901234567', 1),
('9789012345678', 1),
('9789600415584', 4),
('9789600415584', 12),
('9789600419247', 4),
('9789600419247', 15),
('9789600432437', 1),
('9789600432437', 5),
('9789600432437', 14),
('9789600432895', 1),
('9789600432895', 3),
('9789600432895', 12),
('9789601425009', 4),
('9789601425009', 6),
('9789601660105', 1),
('9789601660105', 3),
('9789601660105', 7),
('9789601662741', 1),
('9789601662741', 3),
('9789601662741', 7),
('9789601663069', 1),
('9789601663069', 3),
('9789601663069', 7),
('9789603103397', 1),
('9789603103397', 3),
('9789603103397', 4),
('9789603991473', 1),
('9789603991473', 3),
('9789603991473', 7),
('9789603995044', 1),
('9789603995044', 3),
('9789603995044', 4),
('9789604062389', 1),
('9789604587546', 1),
('9789604587546', 3);

-- --------------------------------------------------------

--
-- Table structure for table `book_school`
--

CREATE TABLE `book_school` (
  `copies_available` int(11) DEFAULT NULL,
  `ISBN` char(13) NOT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_school`
--

INSERT INTO `book_school` (`copies_available`, `ISBN`, `school_id`) VALUES
(0, '11111111111', 4),
(0, '9780140440119', 2),
(0, '9780140440119', 3),
(0, '9780385495318', 2),
(0, '9780786838653', 2),
(1, '9780007117307', 4),
(1, '9780060850524', 1),
(1, '9780199291151', 3),
(1, '9780374332662', 1),
(1, '9780440418320', 3),
(1, '9780521004794', 1),
(1, '9780684169964', 3),
(1, '9780743273565', 2),
(1, '9781904955768', 4),
(2, '9780062068422', 1),
(2, '9780140440393', 3),
(2, '9780312367541', 2),
(2, '9780385495318', 1),
(2, '9780525432483', 3),
(2, '9780684825546', 2),
(2, '9781480437678', 4),
(2, '9789601425009', 4),
(3, '9780064471046', 1),
(3, '9780099546776', 3),
(3, '9780140440393', 2),
(3, '9780451524935', 3),
(3, '9780525432322', 2),
(3, '9780753820254', 2),
(3, '9781408855652', 4),
(3, '9783456789012', 4),
(3, '9787890123456', 2),
(4, '9780307269751', 3),
(4, '9780307948687', 1),
(4, '9780525478812', 3),
(4, '9780684825546', 4),
(4, '9782070361878', 4),
(5, '9780062073778', 3),
(5, '9780140233773', 1),
(5, '9780226458083', 1),
(5, '9780307960498', 2),
(5, '9780345807151', 2),
(5, '9780525432322', 1),
(5, '9780684841263', 4),
(5, '9781781855869', 4),
(6, '9780062073778', 1),
(6, '9780451524935', 1),
(6, '9780571229214', 3),
(6, '9781423106977', 4),
(6, '9789600419247', 4),
(6, '9789603991473', 4),
(7, '9780140440393', 1),
(7, '9780199672776', 2),
(7, '9780307269751', 2),
(7, '9780451526342', 3),
(7, '9780547928227', 2),
(7, '9780684834951', 4),
(7, '9781234567890', 2),
(7, '9782070409274', 4),
(7, '9782253004224', 4),
(7, '9789603995044', 4),
(8, '9780375869020', 1),
(8, '9780435123653', 1),
(8, '9780544336261', 2),
(8, '9780684834951', 2),
(8, '9780747532743', 4),
(8, '9789604587546', 4),
(9, '9780061120084', 1),
(9, '9780062073587', 1),
(9, '9780123456789', 3),
(9, '9780141439518', 3),
(9, '9780307269751', 1),
(9, '9780374332662', 2),
(9, '9780521004794', 3),
(9, '9780571321708', 2),
(9, '9781234567890', 4),
(9, '9781849048134', 4),
(9, '9785678901234', 4),
(10, '9780007117307', 1),
(10, '9780062073556', 1),
(10, '9780140233773', 3),
(10, '9780140439120', 2),
(10, '9780140440119', 1),
(10, '9780345807151', 4),
(10, '9780374332662', 3),
(10, '9780747532743', 2),
(10, '9782253002381', 4),
(10, '9789604062389', 4),
(11, '9780062693662', 3),
(11, '9780345409461', 2),
(11, '9780385504201', 3),
(11, '9780486278070', 3),
(11, '9781451697728', 4),
(11, '9789600432895', 4),
(12, '9780007117307', 3),
(12, '9780224094153', 1),
(12, '9780307960474', 2),
(12, '9780316769488', 3),
(12, '9780375869020', 2),
(12, '9780525432483', 2),
(12, '9780525478812', 1),
(12, '9780590406712', 3),
(12, '9788901234567', 4),
(13, '9780007382161', 3),
(13, '9780141439518', 2),
(13, '9780375708114', 2),
(13, '9780439023481', 1),
(13, '9782070401834', 4),
(14, '9780435123653', 3),
(14, '9780440418320', 1),
(14, '9780525478812', 2),
(14, '9780571321708', 3),
(14, '9782345678901', 4),
(15, '9780224094153', 2),
(15, '9780451526342', 2),
(15, '9781609450786', 4),
(15, '9789601662741', 4),
(16, '9780062073693', 1),
(16, '9780099546790', 1),
(16, '9780099546790', 3),
(16, '9780307948687', 3),
(16, '9780345807151', 3),
(16, '9780571207045', 2),
(16, '9781416561111', 4),
(16, '9782070612758', 4),
(17, '9780553380163', 2),
(18, '9780061122415', 1),
(18, '9780199672776', 3),
(18, '9780345807151', 1),
(18, '9780385504201', 1),
(18, '9780439023481', 3),
(18, '9780525432322', 3),
(18, '9781771643016', 4),
(18, '9781933372600', 4),
(18, '9782070360024', 4),
(18, '9789600415584', 4),
(19, '9780099546776', 1),
(19, '9780141439518', 1),
(19, '9780307948687', 2),
(19, '9780399563126', 2),
(19, '9780684803355', 2),
(19, '9781416561111', 2),
(19, '9781844675639', 4),
(20, '9780140439120', 1),
(20, '9780316769488', 2),
(20, '9780345807090', 3),
(20, '9780439023481', 2),
(20, '9780451526342', 1),
(20, '9781771642484', 4),
(20, '9789601663069', 4),
(21, '9780062073617', 1),
(21, '9780140233773', 2),
(21, '9780199672776', 1),
(21, '9780385495318', 3),
(21, '9780684825546', 3),
(21, '9780743273565', 4),
(21, '9784567890123', 4),
(22, '9780316769488', 1),
(22, '9780375708114', 1),
(23, '9780062073693', 3),
(23, '9780375708114', 3),
(23, '9780399563126', 1),
(23, '9780571207045', 3),
(23, '9781250062185', 4),
(23, '9781577316493', 4),
(23, '9781846689953', 4),
(23, '9789601660105', 4),
(24, '9780140439120', 3),
(24, '9780307960474', 1),
(24, '9780435123653', 2),
(24, '9780451524935', 2),
(24, '9782070360420', 4),
(25, '9780224094153', 3),
(25, '9780226458083', 2),
(25, '9780226458083', 3),
(25, '9780307960498', 1),
(25, '9780345409461', 3),
(25, '9780345807090', 1),
(25, '9780547928227', 3),
(25, '9780571321715', 2),
(25, '9780684841263', 2),
(25, '9789012345678', 4),
(26, '9780399563126', 3),
(26, '9780440418320', 2),
(26, '9780486278070', 1),
(26, '9780544336261', 3),
(26, '9780590406712', 2),
(26, '9780684169964', 2),
(26, '9780753820254', 4),
(27, '9780062693662', 1),
(27, '9780307960474', 3),
(27, '9780571229214', 2),
(27, '9780684803355', 3),
(27, '9786789012345', 4),
(28, '9780007382161', 1),
(28, '9780064471046', 3),
(28, '9780123456789', 1),
(29, '9780199291151', 1),
(29, '9780199291151', 2),
(29, '9780521004794', 2),
(29, '9780525432483', 1),
(29, '9780571321715', 3),
(30, '9780062073488', 1),
(30, '9780312367541', 1),
(30, '9780345807090', 2),
(30, '9780553380163', 3),
(30, '9781250062185', 2),
(30, '9789600432437', 4),
(30, '9789603103397', 4),
(35, '9780385504201', 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
(1, 'History'),
(2, 'Biography'),
(3, 'Science'),
(4, 'Fiction'),
(5, 'Mystery'),
(6, 'Travel'),
(7, 'Self-help'),
(8, 'Cooking'),
(9, 'Science Fiction'),
(10, 'Thriller'),
(11, 'Romance'),
(12, 'Fantasy'),
(13, 'Historical Fiction'),
(14, 'Autobiography'),
(15, 'Religion'),
(16, 'Art'),
(17, 'Music'),
(18, 'Sports'),
(19, 'Poetry'),
(20, 'Drama'),
(23, 'Fun');

-- --------------------------------------------------------

--
-- Table structure for table `lending`
--

CREATE TABLE `lending` (
  `lending_id` int(11) NOT NULL,
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `ISBN` char(13) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lending`
--

INSERT INTO `lending` (`lending_id`, `borrow_date`, `return_date`, `id_user`, `ISBN`, `school_id`) VALUES
(1, '2023-04-18', '2023-04-19', 1, '9780007117307', 1),
(25, '2022-11-11', '2022-11-21', 5, '9780007382161', 1),
(26, '2023-01-10', '2023-01-16', 6, '9780060850524', 1),
(27, '2022-12-04', '2022-12-07', 18, '9780140233773', 2),
(28, '2022-07-10', '2022-07-11', 43, '9780140440119', 2),
(29, '2023-03-02', '2023-03-15', 44, '9780141439518', 2),
(30, '2023-03-19', '2023-03-26', 48, '9780140440119', 3),
(31, '2023-01-11', '2023-01-16', 49, '9780140440393', 3),
(32, '2023-01-15', '2023-01-27', 53, '9780684825546', 4),
(33, '2022-10-09', '2022-10-14', 54, '9780684834951', 4),
(34, '2023-05-10', '2023-05-26', 28, '9780684841263', 4),
(35, '2023-03-17', '2023-03-27', 44, '9780224094153', 2),
(37, '2022-10-05', '2022-11-01', 16, '9780099546790', 3),
(39, '2023-05-08', NULL, 54, '9789604062389', 4),
(40, '2023-05-25', '2023-05-25', 63, '11111111111', 4),
(41, '2023-05-25', '2023-05-25', 63, '11111111111', 4),
(42, '2023-05-25', NULL, 29, '11111111111', 4),
(43, '2023-05-26', '2023-05-26', 28, '9780684825546', 4),
(44, '2023-05-26', '2023-06-02', 28, '9780684825546', 4),
(45, '2023-05-27', NULL, 64, '11111111111', 4),
(46, '2023-03-01', '2023-03-10', 41, '9780007117307', 1),
(47, '2023-03-01', '2023-03-08', 38, '9780007382161', 1),
(48, '2023-04-02', '2023-04-10', 2, '9780007382161', 1),
(49, '2023-04-05', '2023-04-10', 2, '9780061122415', 1),
(50, '2023-02-01', '2023-02-14', 7, '9780062073587', 1),
(51, '2023-02-02', '2023-02-10', 6, '9780062073693', 1),
(52, '2023-04-01', '2023-04-06', 4, '9780062073693', 1),
(53, '2023-05-20', '2023-05-31', 3, '9780385504201', 1),
(54, '2023-05-20', NULL, 4, '9780385504201', 1),
(55, '2023-06-01', NULL, 5, '9780439023481', 1),
(56, '2023-06-01', NULL, 1, '9780439023481', 1),
(57, '2023-01-05', '2023-01-10', 41, '9780007117307', 1),
(58, '2022-02-10', '2022-02-18', 38, '9780007382161', 1),
(59, '2023-01-08', '2023-02-10', 2, '9780007382161', 1),
(60, '2023-02-05', '2023-02-10', 2, '9780061122415', 1),
(61, '2022-03-01', '2022-03-14', 7, '9780062073587', 1),
(62, '2023-03-02', '2023-03-10', 6, '9780062073693', 1),
(63, '2023-05-01', '2023-05-06', 4, '9780062073693', 1),
(64, '2022-02-20', '2022-02-27', 3, '9780385504201', 1),
(65, '2023-04-01', '2023-04-14', 7, '9780062073587', 1),
(66, '2023-01-08', '2023-01-12', 6, '9780062073693', 1),
(67, '2023-02-01', '2023-02-06', 4, '9780062073693', 1),
(68, '2023-04-20', '2023-04-27', 3, '9780385504201', 1),
(69, '2022-04-03', '2022-04-15', 27, '9781234567890', 2),
(70, '2022-05-02', '2022-05-10', 26, '9781234567890', 2),
(71, '2022-06-02', '2022-06-20', 18, '9781416561111', 2),
(72, '2022-10-02', '2022-10-15', 43, '9780786838653', 2),
(73, '2022-11-02', '2022-11-10', 46, '9780747532743', 2),
(74, '2021-12-02', '2021-12-20', 19, '9780753820254', 2),
(75, '2021-09-15', '2021-10-01', 21, '9780684169964', 2),
(76, '2022-12-02', '2022-12-15', 45, '9780684825546', 2),
(77, '2023-05-02', '2023-05-12', 44, '9780684834951', 2),
(78, '2023-05-12', NULL, 25, '9780684803355', 2),
(79, '2023-01-05', '2023-01-10', 41, '9780007117307', 1),
(80, '2022-01-10', '2022-01-18', 38, '9780007382161', 1),
(81, '2022-01-08', '2022-02-10', 2, '9780007382161', 1),
(82, '2023-02-05', '2023-02-10', 2, '9780061122415', 1),
(83, '2023-03-01', '2023-03-14', 7, '9780062073587', 1),
(84, '2022-03-02', '2022-03-10', 6, '9780062073693', 1),
(85, '2022-05-01', '2022-05-06', 4, '9780062073693', 1),
(86, '2022-02-20', '2022-02-27', 3, '9780385504201', 1),
(87, '2023-04-01', '2023-04-14', 7, '9780062073587', 1),
(88, '2022-01-08', '2022-01-12', 6, '9780062073693', 1),
(89, '2022-02-01', '2022-02-06', 4, '9780062073693', 1),
(90, '2023-04-20', '2023-04-27', 3, '9780385504201', 1),
(91, '2022-04-03', '2022-04-15', 27, '9781234567890', 2),
(92, '2022-05-02', '2022-05-10', 26, '9781234567890', 2),
(93, '2022-06-02', '2022-06-20', 18, '9781416561111', 2),
(94, '2022-10-02', '2022-10-15', 43, '9780786838653', 2),
(95, '2022-11-02', '2022-11-10', 46, '9780747532743', 2),
(96, '2021-12-02', '2021-12-20', 19, '9780753820254', 2),
(97, '2021-09-15', '2021-10-01', 21, '9780684169964', 2),
(98, '2022-12-02', '2022-12-15', 45, '9780684825546', 2),
(99, '2023-05-02', '2023-05-12', 44, '9780684834951', 2),
(100, '2023-04-03', '2023-04-15', 27, '9781234567890', 2),
(101, '2023-05-02', '2023-05-10', 26, '9781234567890', 2),
(102, '2021-06-02', '2021-06-20', 18, '9781416561111', 2),
(103, '2021-10-02', '2021-10-15', 43, '9780786838653', 2),
(104, '2021-11-02', '2021-11-10', 46, '9780747532743', 2),
(105, '2022-12-02', '2022-12-20', 19, '9780753820254', 2),
(106, '2022-09-15', '2022-10-01', 21, '9780684169964', 2),
(107, '2022-10-02', '2022-10-15', 45, '9780684825546', 2),
(108, '2023-01-02', '2023-01-12', 44, '9780684834951', 2),
(109, '2022-01-02', '2022-01-12', 44, '9780684834951', 2),
(110, '2022-05-03', '2022-05-15', 27, '9780385495318', 2),
(111, '2022-04-02', '2022-04-10', 26, '9780399563126', 2),
(112, '2022-11-02', '2022-11-20', 18, '9780435123653', 2),
(113, '2023-06-02', NULL, 48, '9780140440119', 3),
(114, '2022-09-02', '2022-09-12', 14, '9780140440393', 3),
(115, '2022-12-02', '2022-12-07', 14, '9780141439518', 3),
(116, '2022-10-02', '2022-10-07', 12, '9780141439518', 3),
(117, '2022-11-11', '2022-11-22', 17, '9780199672776', 3),
(118, '2022-02-02', '2022-02-10', 15, '9780199672776', 3),
(120, '2023-06-02', NULL, 8, '9780226458083', 3),
(124, '2022-04-02', '2022-04-10', 13, '9780307960474', 3),
(125, '2023-06-02', NULL, 50, '9780316769488', 3),
(126, '2023-05-30', NULL, 15, '9780374332662', 3),
(127, '2022-06-02', '2022-06-15', 9, '9780307269751', 3),
(128, '2022-06-01', '2022-06-07', 16, '9780307269751', 3),
(129, '2022-10-02', '2022-10-12', 8, '9780307960474', 3),
(130, '2022-04-02', '2022-04-10', 13, '9780307960474', 3),
(131, '2022-05-02', '2022-05-10', 11, '9780226458083', 3),
(132, '2022-02-02', '2022-02-10', 15, '9780199672776', 3),
(133, '2022-11-11', '2022-11-22', 17, '9780199672776', 3),
(136, '2022-09-02', '2022-09-12', 14, '9780140440393', 3),
(137, '2022-11-02', '2022-11-15', 9, '9780307269751', 3),
(138, '2022-01-02', '2022-01-15', 9, '9780307269751', 3),
(139, '2022-02-01', '2022-02-07', 16, '9780307269751', 3),
(140, '2022-11-02', '2022-11-12', 8, '9780307960474', 3),
(141, '2022-06-02', '2022-06-10', 13, '9780307960474', 3),
(142, '2022-12-02', '2022-12-10', 11, '9780226458083', 3),
(143, '2022-10-02', '2022-10-10', 15, '9780199672776', 3),
(144, '2022-09-11', '2022-09-22', 17, '9780199672776', 3),
(145, '2022-01-02', '2022-01-07', 12, '9780141439518', 3),
(146, '2022-10-02', '2022-10-07', 14, '9780141439518', 3),
(147, '2022-04-02', '2022-04-12', 14, '9780140440393', 3),
(148, '2023-06-02', '2023-06-15', 9, '9780307269751', 3),
(149, '2023-06-01', '2023-06-07', 16, '9780307269751', 3),
(150, '2023-03-02', '2023-03-12', 8, '9780307960474', 3),
(151, '2023-04-02', '2023-04-10', 13, '9780307960474', 3),
(152, '2023-05-02', '2023-05-10', 11, '9780226458083', 3),
(153, '2023-02-02', '2023-02-10', 15, '9780199672776', 3),
(154, '2023-01-11', '2023-01-22', 17, '9780199672776', 3),
(155, '2023-03-02', '2023-03-07', 12, '9780141439518', 3),
(156, '2023-01-02', '2023-01-07', 14, '9780141439518', 3),
(157, '2023-05-02', '2023-05-12', 14, '9780140440393', 3),
(158, '2023-01-02', '2023-01-15', 9, '9780307269751', 3),
(159, '2023-01-02', '2023-01-15', 9, '9780307269751', 3),
(160, '2023-02-01', '2023-02-07', 16, '9780307269751', 3),
(161, '2023-01-02', '2023-01-12', 8, '9780307960474', 3),
(162, '2023-06-02', '2023-06-10', 13, '9780307960474', 3),
(163, '2023-02-02', '2023-02-10', 11, '9780226458083', 3),
(164, '2023-04-02', '2023-04-10', 15, '9780199672776', 3),
(165, '2023-02-11', '2023-02-22', 17, '9780199672776', 3),
(166, '2023-01-02', '2023-01-07', 12, '9780141439518', 3),
(167, '2023-02-02', '2023-02-07', 14, '9780141439518', 3),
(168, '2023-04-02', '2023-04-12', 14, '9780140440393', 3),
(169, '2022-01-10', '2022-01-16', 6, '9780060850524', 1),
(170, '2022-01-08', '2022-01-12', 6, '9780062073693', 1),
(171, '2022-04-01', '2022-04-14', 7, '9780062073587', 1),
(172, '2022-05-01', '2022-05-06', 4, '9780062073693', 1),
(173, '2022-03-02', '2022-03-10', 6, '9780062073693', 1),
(174, '2022-02-02', '2022-02-10', 6, '9780062073693', 1),
(175, '2022-04-01', '2022-04-06', 4, '9780062073693', 1),
(176, '2022-01-05', '2022-01-10', 41, '9780007117307', 1),
(177, '2022-02-01', '2022-02-06', 4, '9780062073693', 1),
(178, '2022-02-01', '2022-02-14', 7, '9780062073587', 1),
(179, '2022-12-12', '2022-12-20', 36, '9789601663069', 4),
(180, '2022-06-02', '2022-06-15', 28, '9789603103397', 4),
(181, '2022-05-02', '2022-05-15', 31, '9789603991473', 4),
(182, '2022-04-02', '2022-04-11', 53, '9789603991473', 4),
(183, '2022-06-02', '2022-06-10', 55, '9782070612758', 4),
(184, '2022-05-02', '2022-05-10', 30, '9782070409274', 4),
(185, '2022-03-02', '2022-03-10', 32, '9782070360024', 4),
(186, '2022-10-02', '2022-10-11', 33, '9782070360024', 4),
(188, '2022-10-20', '2022-10-25', 37, '9781846689953', 4),
(189, '2022-11-11', '2022-11-18', 31, '9781849048134', 4),
(190, '2023-06-02', NULL, 64, '9780345807151', 4),
(191, '2022-01-02', '2022-01-15', 31, '9789603991473', 4),
(193, '2022-02-15', '2022-02-20', 35, '9781933372600', 4),
(194, '2022-03-02', '2022-03-10', 55, '9782070612758', 4),
(195, '2022-04-12', '2022-04-20', 36, '9789601663069', 4),
(196, '2022-06-02', '2022-06-10', 30, '9782070409274', 4),
(197, '2022-05-11', '2022-05-18', 31, '9781849048134', 4),
(198, '2022-09-02', '2022-09-11', 33, '9782070360024', 4),
(199, '2022-10-02', '2022-10-11', 53, '9789603991473', 4),
(200, '2022-01-15', '2022-01-27', 53, '9780684825546', 4),
(201, '2022-11-09', '2022-11-14', 54, '9780684834951', 4),
(202, '2022-05-10', '2022-05-26', 28, '9780684841263', 4),
(203, '2022-12-02', '2022-12-11', 53, '9789603991473', 4),
(204, '2022-04-15', '2022-04-27', 53, '9780684825546', 4),
(205, '2022-02-09', '2022-02-14', 54, '9780684834951', 4),
(206, '2022-03-10', '2022-03-26', 28, '9780684841263', 4),
(207, '2023-06-02', NULL, 41, '9780007117307', 1),
(208, '2023-06-02', NULL, 4, '9780062073693', 1),
(209, '2023-06-02', NULL, 6, '9780062073693', 1),
(210, '2023-06-02', NULL, 43, '9780786838653', 2),
(211, '2023-06-02', NULL, 21, '9780684169964', 2),
(212, '2023-06-02', NULL, 18, '9781416561111', 2),
(213, '2023-06-02', NULL, 26, '9781234567890', 2),
(214, '2023-06-02', NULL, 12, '9780141439518', 3),
(215, '2023-06-02', NULL, 17, '9780199672776', 3),
(216, '2023-06-02', NULL, 14, '9780141439518', 3),
(217, '2023-06-02', NULL, 28, '9780684825546', 4);

--
-- Triggers `lending`
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
-- Table structure for table `pending_reviews`
--

CREATE TABLE `pending_reviews` (
  `review_id` int(11) NOT NULL,
  `star_review` int(11) NOT NULL,
  `review_text` varchar(500) DEFAULT NULL,
  `ISBN` char(13) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `star_review` int(11) NOT NULL,
  `review_text` varchar(500) DEFAULT NULL,
  `ISBN` char(13) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `star_review`, `review_text`, `ISBN`, `id_user`) VALUES
(1, 4, 'It was great!', '9780007117307', 1),
(2, 2, 'bad', '9781250062185', 28),
(3, 4, 'very environmentally friendly', '9781771642484', 28),
(4, 5, 'Liked it a lot', '9780684834951', 28),
(5, 4, 'nice', '9781451697728', 28),
(7, 1, 'did not like it very boring', '9789603991473', 31),
(8, 1, 'did not like it very boring', '9789603991473', 31),
(9, 2, 'not good', '9780684825546', 28),
(10, 4, 'very interesting', '9782070612758', 55),
(11, 5, 'best book i have read this year', '9789601663069', 36),
(12, 4, 'it was nice', '9782070409274', 30),
(13, 3, 'it was ok', '9781933372600', 35),
(14, 3, 'nothing special', '9781849048134', 31),
(15, 2, 'boring', '9780486278070', 6),
(16, 3, 'pleasant', '9780062073693', 6),
(17, 4, 'really liked it', '9780062073587', 7),
(18, 5, 'awesome', '9780486278070', 4),
(19, 4, 'pretty good', '9780199672776', 6),
(20, 3, 'nice to read on vacation', '9780062073693', 6),
(21, 2, 'quite bad', '9780062073693', 4),
(22, 1, 'not for me', '9780007117307', 41),
(23, 1, 'the worst I have read so far', '9780140440393', 4),
(24, 4, 'i enjoyed it', '9780062073587', 7);

-- --------------------------------------------------------

--
-- Table structure for table `schools`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`school_id`, `name`, `director`, `address`, `city`, `post_code`, `telephone_number`, `email`) VALUES
(1, 'Athenaeum High School', 'Maria Georgiou', '2 Plato Street', 'Athens', '10438', '2105551234', 'athenaeumhigh@example.com'),
(2, 'Eureka College', 'Nikos Papadopoulos', '3 Socrates Avenue', 'Thessaloniki', '54623', '2310555123', 'eurekacollege@example.com'),
(3, 'Olympus Academy', 'Eleni Katsikaris', '1 Pindarou Street', 'Piraeus', '18540', '2105552345', 'olympusacademy@example.com'),
(4, 'Delphi School', 'Stavros Athanasiou', '4 Pythia Street', 'Delphi', '33054', '2269555123', 'delphischool@example.com'),
(9, '1o Gel Kalamatas', 'Stylianidis', 'Lykourgou 5', 'Kalamata', '24131', '2721085291', '1gel@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name`, `username`, `password`, `school_id`, `role`, `birthday`, `active`) VALUES
(1, 'John Doe', 'johndoe', 'password1', 1, 0, '2006-07-03', b'1'),
(2, 'Jane Doe', 'janedoe', 'password2', 1, 0, '2007-09-28', b'1'),
(3, 'Bob Smith', 'bobsmith', 'password3', 1, 0, '2013-12-16', b'1'),
(4, 'Alice Johnson', 'alicej', 'password4', 1, 0, '2008-02-02', b'1'),
(5, 'Max Brown', 'maxbrown', 'password5', 1, 0, '2012-05-18', b'1'),
(6, 'Emily Davis', 'emilyd', 'password6', 1, 0, '2010-08-11', b'1'),
(7, 'Tom Wilson', 'tomwilson', 'password7', 1, 0, '2005-11-21', b'1'),
(8, 'Dimitrios Georgiou', 'dimitriosg', 'password1', 3, 0, '2014-01-09', b'1'),
(9, 'Maria Papadopoulos', 'mariap', 'password2', 3, 0, '2009-04-14', b'1'),
(10, 'Nikos Ioannidis', 'nikosi', 'password3', 3, 0, '2012-06-25', b'1'),
(11, 'Eleni Katsarou', 'elenik', 'password4', 3, 0, '2011-09-06', b'1'),
(12, 'Vasilis Kyriakopoulos', 'vasilisk', 'password5', 3, 0, '2004-12-27', b'1'),
(13, 'Katerina Mitsi', 'katerinam', 'password6', 3, 0, '2012-02-23', b'1'),
(14, 'Yannis Tsakiris', 'yannist', 'password7', 3, 0, '2007-05-15', b'1'),
(15, 'Eirini Papadaki', 'eirinip', 'password8', 3, 0, '2009-08-07', b'1'),
(16, 'Stavros Koulouris', 'stavrosk', 'password9', 3, 0, '2013-11-30', b'1'),
(17, 'Andreas Pappas', 'andreasp', 'password10', 3, 0, '2008-02-18', b'1'),
(18, 'Andreas Tsakalidis', 'andreasts', 'SecurePass123', 2, 0, '2011-04-08', b'1'),
(19, 'Eleni Karagouni', 'elenikar', 'StrongPass456', 2, 0, '2006-08-03', b'1'),
(20, 'Yannis Lekakis', 'yannislek', 'MyPassword789', 2, 0, '2010-01-29', b'1'),
(21, 'Athina Sidiropoulou', 'athinasid', 'ComplexPassword', 2, 0, '2005-09-23', b'1'),
(22, 'Nikolas Giannakopoulos', 'nikolasgi', 'MyPass1234', 2, 0, '2013-06-01', b'1'),
(23, 'Stavros Papadopoulos', 'stavrospap', 'SecurePassword1', 2, 0, '2007-03-11', b'1'),
(24, 'Maria Antoniou', 'mariaant', 'StrongPassword2', 2, 0, '2009-11-04', b'1'),
(25, 'Dimitris Christopoulos', 'dimitrisch', 'Password123', 2, 0, '2012-12-23', b'1'),
(26, 'Eleni Tsakiri', 'elenitsa', 'ComplexPass12', 2, 0, '2005-01-19', b'1'),
(27, 'Thanos Kallergis', 'thanoskal', 'MyPass1234', 2, 0, '2010-04-05', b'1'),
(28, 'Eleni Georgiou', 'elenig', '1', 4, 0, '2012-01-21', b'1'),
(29, 'Nikos Papadopoulos', 'nikosp', 'P@ssword456', 4, 0, '2008-07-17', b'1'),
(30, 'Maria Athanasiou', 'mariat', 'P@ssword789', 4, 0, '2011-10-22', b'1'),
(31, 'Dimitris Katsikaris', 'dimitrisk', 'P@ssword1234', 4, 0, '2007-12-09', b'1'),
(32, 'Katerina Antoniou', 'katerinaa', 'P@ssword5678', 4, 0, '2009-02-06', b'1'),
(33, 'Giannis Makris', 'giannism', 'P@ssword9012', 4, 0, '2013-08-14', b'1'),
(34, 'Eirini Papanikolaou', 'eirinip', 'P@ssword3456', 4, 0, '2006-06-01', b'1'),
(35, 'Yannis Zografos', 'yannisz', 'P@ssword7890', 4, 0, '2007-12-12', b'1'),
(36, 'Stavros Kourakis', 'stavrosk', 'P@ssword12345', 4, 0, '2010-02-16', b'1'),
(37, 'Vasilis Kiriakidis', 'vasilisk', 'P@ssword67890', 4, 0, '2013-08-19', b'1'),
(38, 'John Smith', 'johns', 'password12', 1, 1, '1972-04-27', b'1'),
(39, 'Karen Lee', 'karenl', '1', 1, 2, '1984-09-03', b'1'),
(40, 'William Chen', 'williamc', 'password14', 1, 1, '1979-02-12', b'1'),
(41, 'Mary Kim', 'maryk', 'password15', 1, 1, '1981-11-11', b'1'),
(42, 'Nikos Katsikopoulos', 'nikoskats', '1', 2, 2, '1990-07-18', b'1'),
(43, 'Eleni Mavroudi', 'elenimav', 'SecurePass12', 2, 1, '1978-05-25', b'1'),
(44, 'Dimitris Papageorgiou', 'dimitrispg', 'ComplexPassword', 2, 1, '1983-03-09', b'1'),
(45, 'Maria Georgiou', 'mariageo', 'StrongPass123', 2, 1, '1974-09-22', b'1'),
(46, 'Kostas Christodoulou', 'kostasch', 'DifficultPass12', 2, 1, '1975-11-02', b'1'),
(47, 'Christina Vlachou', 'christinavlacho', '1', 3, 2, '1989-02-20', b'1'),
(48, 'Stefanos Kiriakopoulos', 'stefanoskiriako', '2Fj!sDn7$8hZ', 3, 1, '1995-06-13', b'1'),
(49, 'Angelos Vasilopoulos', 'angelosvasilopo', '3Kp#zTm6$0xR', 3, 1, '1977-08-29', b'1'),
(50, 'Katerina Georgiou', 'katerinageorgio', '1Df@qWn2^8zR', 3, 1, '1985-12-08', b'1'),
(51, 'Nikos Antonopoulos', 'nikosantonopoul', '4Vt$gLp5#7cB', 3, 1, '1991-10-07', b'1'),
(52, 'Alexandros Papadopoulos', 'apapadopoulos', '1', 4, 2, '1982-01-14', b'1'),
(53, 'Eleni Georgiou', 'egeorgiou', 'S3cur3P@ss', 4, 1, '1992-04-19', b'1'),
(54, 'Nikolaos Michalopoulos', 'nmichalopoulos', 'Str0ngP@ss', 4, 1, '1976-03-07', b'1'),
(55, 'Athanasios Andreadis', 'aandreadis', 'P@ssw0rd!23', 4, 1, '1980-06-30', b'1'),
(56, 'Anastasia P', 'anastazee', '1', NULL, 3, '2002-02-14', b'1'),
(63, 'anast poul', 'anast', '1', 4, 0, '2009-08-15', b'0'),
(64, 'Harris Platanos', 'harrisp', '28', 4, 0, '2002-05-02', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `users_unregistered`
--

CREATE TABLE `users_unregistered` (
  `id_user` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `author_book`
--
ALTER TABLE `author_book`
  ADD PRIMARY KEY (`ISBN`,`author_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `idx_booking_date` (`date_of_booking`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`ISBN`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `book_school`
--
ALTER TABLE `book_school`
  ADD PRIMARY KEY (`ISBN`,`school_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `idx_copies` (`copies_available`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `lending`
--
ALTER TABLE `lending`
  ADD PRIMARY KEY (`lending_id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `idx_borrow_date` (`borrow_date`);

--
-- Indexes for table `pending_reviews`
--
ALTER TABLE `pending_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`school_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_role` (`role`);

--
-- Indexes for table `users_unregistered`
--
ALTER TABLE `users_unregistered`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `school_id` (`school_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `lending`
--
ALTER TABLE `lending`
  MODIFY `lending_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `pending_reviews`
--
ALTER TABLE `pending_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `users_unregistered`
--
ALTER TABLE `users_unregistered`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `author_book`
--
ALTER TABLE `author_book`
  ADD CONSTRAINT `author_book_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `author_book_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_book` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE;

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`),
  ADD CONSTRAINT `fk_booking_book` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking_sch` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking_us` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE;

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `book_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_book_cat` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE;

--
-- Constraints for table `book_school`
--
ALTER TABLE `book_school`
  ADD CONSTRAINT `book_school_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `book_school_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`),
  ADD CONSTRAINT `fk_book_sch` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_school_bk` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`) ON UPDATE CASCADE;

--
-- Constraints for table `lending`
--
ALTER TABLE `lending`
  ADD CONSTRAINT `fk_lending_book` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lending_sch` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lending_us` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lending_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `lending_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `lending_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`);

--
-- Constraints for table `pending_reviews`
--
ALTER TABLE `pending_reviews`
  ADD CONSTRAINT `pending_reviews_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `pending_reviews_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_review_bk` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_review_us` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_school` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`);

--
-- Constraints for table `users_unregistered`
--
ALTER TABLE `users_unregistered`
  ADD CONSTRAINT `users_unregistered_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
