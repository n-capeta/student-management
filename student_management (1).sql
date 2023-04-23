-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2023 at 03:28 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignment_id` varchar(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `due_date` date NOT NULL,
  `point_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`assignment_id`, `name`, `due_date`, `point_value`) VALUES
('AAR1', 'Keep a dream diary', '2023-05-22', 15),
('ACH1', 'Read three books about Summoning Charms', '2023-05-09', 10),
('ACM1', 'Go to Hagrids Hut and make notes about the Blast-Ended Skrewts behavior', '2023-05-13', 10),
('ADA1', 'Write essay on werewolves', '2023-05-06', 20),
('ADA2', 'Write essay on vampires', '2023-05-07', 20),
('ADA3', 'Practice Vanishing Spells and write essay on Inanimatus Conjurus Spell', '2023-05-14', 20),
('AHE1', 'Research dittany in One Thousand Magical Herbs and Fungi', '2023-05-02', 15),
('AHE2', 'Collect ingredients for the Antidote to Uncommon Poisons', '2023-05-05', 15),
('AHE3', 'Write essay on venom antidotes', '2023-05-16', 10),
('AHE4', 'Collect five Moly plants, Mandrakes and other ingredients for class', '2023-05-18', 10),
('AHE5', 'Copy and complete a diagram of a Chinese Chomping Cabbage', '2023-05-19', 15),
('AHE6', 'Label the drawing of a Bowtruckle', '2023-05-21', 10),
('AHI1', 'Write essay on the Medieval Assembly of European Wizards', '2023-05-03', 20),
('AHI2', 'Write poem about Gilderoy Lockharts defeat of the Wagga Wagga Werewolf', '2023-05-04', 10),
('AHI3', 'Write an essay about Goblin Rebellions', '2023-05-11', 20),
('AMS1', 'Read Home Life and Social Habits of British Muggles and write an essay on why Muggles need electrici', '2023-05-08', 15),
('APO1', 'Collect ingredients for Wiggenweld Potion', '2023-05-01', 10),
('APO2', 'Explore antidotes', '2023-05-10', 15),
('APO3', 'Write essay on how to properly brew Strengthening Solution', '2023-05-17', 20),
('AST1', 'Write essay on the properties of Moonstone and its uses in Potion making', '2023-05-15', 15),
('AST2', 'Label a star chart of Jupiter and its moons and write an essay on Jupiters moons', '2023-05-20', 20),
('ATR1', 'Write essay on Cross-Species Transfiguration', '2023-05-12', 15);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` varchar(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `teacher_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `name`, `teacher_id`) VALUES
('CAR1', 'Ancient Runes', '1AR'),
('CAS1', 'Astronomy', '1AS'),
('CCH1', 'Charms', '1CH'),
('CCM1', 'Care of Magical Creatures', '1CM'),
('CCM2', 'Care of Magical Creatures', '2CM'),
('CCM3', 'Care of Magical Creatures', '3CM'),
('CDA1', 'Defence Against the Dark Arts', '1DA'),
('CDA2', 'Defence Against the Dark Arts', '2DA'),
('CDA3', 'Defence Against the Dark Arts', '3DA'),
('CDA4', 'Defence Against the Dark Arts', '4DA'),
('CDA5', 'Defence Against the Dark Arts', '5DA'),
('CDI1', 'Divination', '1DI'),
('CHE1', 'Herbology', '1HE'),
('CHM1', 'History of Magic', '1HM'),
('CMS1', 'Muggle Studies', '1MS'),
('CMS2', 'Muggle Studies', '2MS'),
('CPO1', 'Potions', '1PO'),
('CPO2', 'Potions', '2PO'),
('CTR1', 'Transfiguration', '1TR'),
('CTR2', 'Transfiguration', '2TR');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `house` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `house`, `username`, `password`) VALUES
(100, 'Harry', 'Potter', 'Gryffindor', 'harryp', 'chosen1');

-- --------------------------------------------------------

--
-- Table structure for table `student_enrollment`
--

CREATE TABLE `student_enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` varchar(4) NOT NULL,
  `teacher_id` varchar(3) NOT NULL,
  `assignment_id` varchar(4) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_enrollment`
--

INSERT INTO `student_enrollment` (`enrollment_id`, `student_id`, `course_id`, `teacher_id`, `assignment_id`, `grade`) VALUES
(1, 100, 'CDA3', '3DA', 'ADA1', 16),
(2, 100, 'CPO2', '2PO', 'APO1', 9),
(3, 100, 'CHE1', '1HE', 'AHE4', 12),
(4, 100, 'CTR1', '1TR', 'ATR1', 14);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` varchar(3) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `subject_area` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `first_name`, `last_name`, `subject_area`, `email`, `username`, `password`, `is_admin`) VALUES
('1AR', 'Bathsheba', 'Babbling', 'Ancient Runes', 'bbabbling@hogwarts.edu', 'bbabbling', 'babbly', 1),
('1AS', 'Aurora', 'Sinistra', 'Astronomy', 'asinistra@hogwarts.edu', 'asinistra', 'franksinatra', 1),
('1CH', 'Filius', 'Flitwick', 'Charms', 'fflitwick@hogwarts.edu', 'fflitwick', 'flintyboy', 1),
('1CM', 'Wilhelmina', 'Grubbly-Plank', 'Care of Magical Creatures', 'wgrubblyplank@hogwarts.edu', 'wgrubblyplank', 'grubwormly', 1),
('1DA', 'Amycus', 'Carrow', 'Defence Against the Dark Arts', 'acarrow@hogwarts.edu', 'amycuscarrow', 'bonemarrow', 1),
('1DI', 'Firenze', '', 'Divination', 'firenze@hogwarts.edu', 'firenze', 'firenthehole', 1),
('1HE', 'Pomona', 'Sprout', 'Herbology', 'psprout@hogwarts.edu', 'psprout', 'sprouteytouty', 1),
('1HM', 'Cuthbert', 'Binns', 'History of Magic', 'cbinns@hogwarts.edu', 'cbinns', 'ilovevoldey', 1),
('1MS', 'Charity', 'Burbage', 'Muggle Studies', 'cburbage@hogwarts.edu', 'cburbage', 'burburypurse', 1),
('1PO', 'Horace', 'Slughorn', 'Potions', 'hslughorn@hogwarts.edu', 'hslughorn', 'sluggyboy', 1),
('1TR', 'Albus', 'Dumbledore', 'Transfiguration', 'adumbledore@hogwarts.edu', 'adumbledore', 'thebosstopg', 1),
('2CM', 'Rubeus', 'Hagrid', 'Care of Magical Creatures', 'rhagrid@hogwarts.edu', 'rhagrid', 'urawizardharry', 1),
('2DA', 'Gilderoy', 'Lockhart', 'Defence Against the Dark Arts', 'glockhart@hogwarts.edu', 'glockhart', 'cupiddestroyer', 1),
('2MS', 'Alecto', 'Carrow', 'Muggle Studies', 'acarrow@hogwarts.edu', 'acarrow', 'scarecrow2', 1),
('2PO', 'Severus', 'Snape', 'Potions', 'ssnape@hogwarts.edu', 'ssnape', 'OBviosely', 1),
('2TR', 'Minerva', 'McGonagall', 'Transfiguration', 'mmcgonagall@hogwarts.edu', 'mmcgonagall', 'thetrueGOAT', 1),
('3CM', 'Silvanus', 'Kettleburn', 'Care of Magical Creatures', 'skettleburn@hogwarts.edu', 'skettleburn', 'kettlechips', 1),
('3DA', 'Remus', 'Lupin', 'Defence Against the Dark Arts', 'rlupin@hogwarts.edu', 'rlupin', 'werewolfsecret', 1),
('4DA', 'Alastor \"Mad-Eye\"', 'Moody', 'Defence Against the Dark Arts', 'amoody@hogwarts.edu', 'amoody', 'idgafboutnothin', 1),
('5DA', 'Quirinus', 'Quirrell', 'Defence Against the Dark Arts', 'qquirrell@hogwarts.edu', 'qquirrell', 'squirrelruff', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`assignment_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `student_enrollment`
--
ALTER TABLE `student_enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `assignment_id` (`assignment_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `student_enrollment`
--
ALTER TABLE `student_enrollment`
  ADD CONSTRAINT `student_enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `student_enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `student_enrollment_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `student_enrollment_ibfk_4` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`assignment_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
