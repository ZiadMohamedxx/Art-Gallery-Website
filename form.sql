-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 21, 2024 at 03:59 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `form`
--

-- --------------------------------------------------------

--
-- Table structure for table `artwork`
--

DROP TABLE IF EXISTS `artwork`;
CREATE TABLE IF NOT EXISTS `artwork` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `artistname` varchar(30) NOT NULL,
  `price` int NOT NULL,
  `description` varchar(200) NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `artwork`
--

INSERT INTO `artwork` (`ID`, `name`, `artistname`, `price`, `description`, `img`) VALUES
(1, 'The Starry Night\r\n', 'vincent van gogh', 3000, 'The painting features a nocturnal scene with a village, a cypress tree, and a dominant swirling sky filled with stars, crescent moon, and clouds. The sky is depicted in a deep blue color with a range ', 'https://images.desenio.com/zoom/15961_2-48525.jpg'),
(2, 'Sunflowers', 'vincent van gogh', 300, 'The \'Sunflowers\' were meant to symbolise gratitude.(1888)\r\n\r\n', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG-5-zTiaA7vggKCTNTHQvZWnj5FGeRrE8Wg&s'),
(3, 'The Potato Eaters', 'vincent van gogh', 500, 'The painting had to depict the harsh reality of country life, so he gave the peasants coarse faces and bony, working hands. He wanted to show in this way that they \'have tilled the earth themselves wi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7_9yD7jbu7wmfQbGdvlsWRXPF-n3fYfMqsg&s'),
(4, 'Mona Lisa', 'leonardo da vinci', 2000, 'The woman sits markedly upright in a \"pozzetto\" armchair with her arms folded, a sign of her reserved posture. Her gaze is fixed on the observer.(1503)', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0s5B5TIgNtd8NBG31BBu2v1cCxIZi3AEE2g&s'),
(5, 'The Last Supper', 'leonardo da vinci', 999, 'Jesus blessed bread and broke it, telling the disciples, “Take, eat; this is my body.” He then passed a cup of wine to them, saying, “This is my blood.” (1498)', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_kAgxWX0qO1SaTpKZmDf9ll1BB83tKgxREA&s'),
(6, 'Lady with an Ermine', 'leonardo da vinci', 600, 'It depicts a half-height woman turned toward her right at a three-quarter angle, but with her face turned toward her left. The animal in her arms twists in a similar manner, resulting in considerable ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVPG_EK1zi5NNJ5op4AduEWFN0kfRenxGdvQ&s'),
(7, 'Portrait of Dora Maar', 'pablo picasso', 500, 'Picasso\'s portrait of Dora Maar is an oil on canvas painting, which depicts the subject sitting in a chair. She is portrayed as an elegant woman, with fine jewellery and clothing. (1937)', 'https://upload.wikimedia.org/wikipedia/en/d/d4/Portrait_of_Dora_Maar.jpg'),
(8, 'Girl Before a Mirror', 'pablo picasso', 499, 'The girl is looking at her own sense of mortality in the mirror, which is darker in color and bleaker. (1932)', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5BZh94mnpg-n46MTathYFZoLZR6JMHUiDDg&s'),
(9, 'The Old Guitarist', 'pablo picasso', 800, 'The Old Guitarist painting sends a universal message of struggle and poverty as represented through the colors, figure, and composition. (1904)', 'https://upload.wikimedia.org/wikipedia/en/b/bc/Old_guitarist_chicago.jpg'),
(10, 'The Scream', 'edvard munch', 900, 'This painting is part of his series \"The Frieze of Life,\" a thematic cycle depicting love, angst, and death, showcasing Munch\'s interest in portraying the universal anxieties of the human condition. (', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUsa-UdmBnZhaSe6Fvy405FlawdSG0FeFN4A&s'),
(11, 'Anxiety', 'edvard munch', 499, 'The faces show despair and the dark colors show a depressed state. Many critics also believe it\'s meant to show the emotions of heartbreak and sorrow. (1894)', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJq2qQQH9_MlqB02lB5LeU2d8TCEZCu1Oa2A&s'),
(12, 'The Sick Child', 'edvard munch', 899, 'The Sick Child became for Munch—who nearly died from tuberculosis himself as a child—a means to record both his feelings of despair and guilt that he had been the one to survive and to confront his fe', 'https://media.tate.org.uk/art/images/work/N/N05/N05035_10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `name`, `username`, `password`) VALUES
(1, 'nada', 'nadaemad', '123456'),
(2, 'nada emad', 'nada', '123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
