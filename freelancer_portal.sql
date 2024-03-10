-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2024 at 08:22 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freelancer_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientprofile`
--

CREATE TABLE `clientprofile` (
  `clientID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `companyName` varchar(100) NOT NULL DEFAULT '-',
  `companyInfo` text NOT NULL DEFAULT '-',
  `ProjectRequirements` text NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clientprofile`
--

INSERT INTO `clientprofile` (`clientID`, `userID`, `companyName`, `companyInfo`, `ProjectRequirements`) VALUES
(1, 2, 'ABC Corp', 'Software development company', 'Looking for a web developer for a new project'),
(2, 4, 'XYZ Ltd', 'Marketing agency', 'Seeking content writers for blog posts'),
(3, 6, 'LMN Enterprises', 'Consulting firm', 'Hiring consultants for a project'),
(4, 8, 'PQR Solutions', 'IT Services provider', 'Looking for software developers for a project'),
(5, 10, 'JKL Inc', 'E-commerce company', 'Hiring graphic designers for website design');

-- --------------------------------------------------------

--
-- Table structure for table `freelancerprofile`
--

CREATE TABLE `freelancerprofile` (
  `freelancerID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `skills` varchar(150) NOT NULL DEFAULT '-',
  `expertise` varchar(150) NOT NULL DEFAULT '-',
  `portfolio` text NOT NULL DEFAULT '-',
  `hourlyRate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `availability` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `freelancerprofile`
--

INSERT INTO `freelancerprofile` (`freelancerID`, `userID`, `skills`, `expertise`, `portfolio`, `hourlyRate`, `availability`) VALUES
(1, 1, 'Web Development, Graphic Design', '10 years experience', 'www.portfolio.com', '50.00', 1),
(2, 3, 'Content Writing, SEO', '5 years experience', 'www.contentportfolio.com', '40.00', 1),
(3, 5, 'Mobile App Development', '8 years experience', 'www.mobileapps.com', '60.00', 1),
(4, 7, 'Digital Marketing', '7 years experience', 'www.digitalmarketing.com', '45.00', 1),
(5, 9, 'Data Entry, Virtual Assistance', '3 years experience', 'www.virtualassistance.com', '35.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `freelancerrating`
--

CREATE TABLE `freelancerrating` (
  `freelancerRatingID` int(11) NOT NULL,
  `freelancerID` int(11) NOT NULL,
  `feedbackUserId` int(11) NOT NULL,
  `ratings` decimal(3,2) NOT NULL,
  `feedback` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `freelancerrating`
--

INSERT INTO `freelancerrating` (`freelancerRatingID`, `freelancerID`, `feedbackUserId`, `ratings`, `feedback`) VALUES
(1, 1, 2, '4.50', 'Excellent work on the website project.'),
(2, 3, 2, '4.00', 'Good communication and quality of work.'),
(3, 5, 4, '4.80', 'Highly skilled freelancer. Delivered the project on time.'),
(4, 2, 1, '4.20', 'Great experience working with Jane. Highly recommended.'),
(5, 4, 5, '4.70', 'The digital marketing campaign was a success. Good job!');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `messageID` int(11) NOT NULL,
  `senderID` int(11) DEFAULT NULL,
  `recipientID` int(11) DEFAULT NULL,
  `messageContent` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `readStatus` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`messageID`, `senderID`, `recipientID`, `messageContent`, `timestamp`, `readStatus`) VALUES
(1, 1, 2, 'Hi Jane, I saw your project posting and I am interested in working on it.', '2024-03-10 03:03:35', 0),
(2, 3, 1, 'Hello John, I have reviewed your portfolio and I am impressed with your work.', '2024-03-10 03:03:35', 0),
(3, 2, 3, 'Hi Sam, we have some content writing projects available. Are you interested?', '2024-03-10 03:03:35', 0),
(4, 4, 5, 'Hi Sara, let\'s discuss the details of the digital marketing campaign.', '2024-03-10 03:03:35', 0),
(5, 5, 4, 'Hello Peter, could you provide more information about the project requirements?', '2024-03-10 03:03:35', 0);

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `milestoneID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `description` text NOT NULL,
  `dueDate` date DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`milestoneID`, `projectID`, `description`, `dueDate`, `status`) VALUES
(1, 1, 'Design phase completed', '2024-03-10', 'Completed'),
(2, 2, 'First batch of articles written', '2024-03-15', 'In Progress'),
(3, 3, 'Wireframing completed', '2024-03-12', 'Pending'),
(4, 4, 'Social media marketing setup', '2024-03-20', 'In Progress'),
(5, 5, 'Data entry tasks assigned', '2024-03-18', 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notificationID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `notificationContent` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notificationID`, `userID`, `notificationContent`, `timestamp`) VALUES
(1, 1, 'You have a new message from Jane.', '2024-03-10 03:05:44'),
(2, 2, 'You have a new project proposal from John.', '2024-03-10 03:05:44'),
(3, 3, 'New project opportunities available. Check your dashboard.', '2024-03-10 03:05:44'),
(4, 4, 'New message received. Please check your inbox.', '2024-03-10 03:05:44'),
(5, 5, 'You have a new project assignment. Check details in your dashboard.', '2024-03-10 03:05:44');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `paymentID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentID`, `projectID`, `amount`, `status`) VALUES
(1, 1, '2500.00', 'Paid'),
(2, 3, '4000.00', 'Pending'),
(3, 5, '1500.00', 'Paid'),
(4, 2, '500.00', 'Pending'),
(5, 4, '2000.00', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `projectID` int(11) NOT NULL,
  `clientID` int(11) DEFAULT NULL,
  `projectDetails` text NOT NULL,
  `requirements` text NOT NULL,
  `budget` decimal(15,2) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectID`, `clientID`, `projectDetails`, `requirements`, `budget`, `status`) VALUES
(1, 1, 'Build a website', 'Responsive design, E-commerce functionality', '5000.00', 'Open'),
(2, 2, 'Content writing for blog posts', 'SEO optimized content', '1000.00', 'In Progress'),
(3, 3, 'Develop a mobile app', 'iOS and Android platforms', '8000.00', 'Open'),
(4, 4, 'Digital marketing campaign', 'Social media marketing, SEO', '3000.00', 'Open'),
(5, 5, 'Data entry and virtual assistance', 'Data management, Customer support', '2000.00', 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `projectassignment`
--

CREATE TABLE `projectassignment` (
  `assignmentID` int(11) NOT NULL,
  `freelancerID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projectassignment`
--

INSERT INTO `projectassignment` (`assignmentID`, `freelancerID`, `projectID`, `status`) VALUES
(1, 1, 1, 'Assigned'),
(2, 2, 2, 'Assigned'),
(3, 3, 3, 'Assigned'),
(4, 4, 4, 'Assigned'),
(5, 5, 5, 'Assigned');

-- --------------------------------------------------------

--
-- Table structure for table `projectfeedback`
--

CREATE TABLE `projectfeedback` (
  `projectFeedbackID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `ratings` decimal(3,2) NOT NULL,
  `feedbackContent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projectfeedback`
--

INSERT INTO `projectfeedback` (`projectFeedbackID`, `projectID`, `userID`, `ratings`, `feedbackContent`) VALUES
(1, 1, 2, '4.50', 'Great experience working with John. Highly recommended.'),
(2, 2, 1, '4.00', 'Jane provided excellent content for our blog posts.'),
(3, 3, 3, '4.80', 'Sam is an excellent mobile app developer. Highly skilled.'),
(4, 4, 5, '4.70', 'Sara delivered outstanding results for the digital marketing campaign.'),
(5, 5, 4, '4.50', 'Peter provided exceptional virtual assistance services.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contactInfo` varchar(100) NOT NULL,
  `userType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `firstName`, `lastName`, `email`, `address`, `contactInfo`, `userType`) VALUES
(1, 'john_doe', 'password123', 'John', 'Doe', 'john@example.com', '123 Main St, London', '+1234567890', 1),
(2, 'jane_smith', 'qwerty456', 'Jane', 'Smith', 'jane@example.com', '456 Park Ave, London', '+9876543210', 2),
(3, 'sam_jones', 'sam123', 'Sam', 'Jones', 'sam@example.com', '789 Broadway, London', '+1112223333', 1),
(4, 'sara_williams', 'sara456', 'Sara', 'Williams', 'sara@example.com', '321 Oak St, London', '+4445556666', 2),
(5, 'mark_jackson', 'mark789', 'Mark', 'Jackson', 'mark@example.com', '555 Maple Ave, London', '+7778889999', 1),
(6, 'anna_king', 'anna123', 'Anna', 'King', 'anna@example.com', '678 Elm St, London', '+9998887777', 2),
(7, 'peter_brown', 'peter456', 'Peter', 'Brown', 'peter@example.com', '987 Pine St, London', '+3334445555', 1),
(8, 'emily_taylor', 'emily789', 'Emily', 'Taylor', 'emily@example.com', '234 Oak St, London', '+6667778888', 2),
(9, 'michael_clark', 'michael123', 'Michael', 'Clark', 'michael@example.com', '876 Birch St, London', '+1112223333', 1),
(10, 'sophia_anderson', 'sophia456', 'Sophia', 'Anderson', 'sophia@example.com', '345 Cedar St, London', '+9998887777', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `userTypeID` int(11) NOT NULL,
  `userType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`userTypeID`, `userType`) VALUES
(1, 'freelancer'),
(2, 'client'),
(3, 'admin'),
(4, 'moderator'),
(5, 'owner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientprofile`
--
ALTER TABLE `clientprofile`
  ADD PRIMARY KEY (`clientID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `freelancerprofile`
--
ALTER TABLE `freelancerprofile`
  ADD PRIMARY KEY (`freelancerID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `freelancerrating`
--
ALTER TABLE `freelancerrating`
  ADD PRIMARY KEY (`freelancerRatingID`),
  ADD KEY `freelancerID` (`freelancerID`),
  ADD KEY `feedbackUserId` (`feedbackUserId`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`messageID`),
  ADD KEY `senderID` (`senderID`),
  ADD KEY `recipientID` (`recipientID`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`milestoneID`),
  ADD KEY `projectID` (`projectID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notificationID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `projectID` (`projectID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectID`),
  ADD KEY `clientID` (`clientID`);

--
-- Indexes for table `projectassignment`
--
ALTER TABLE `projectassignment`
  ADD PRIMARY KEY (`assignmentID`),
  ADD KEY `freelancerID` (`freelancerID`),
  ADD KEY `projectID` (`projectID`);

--
-- Indexes for table `projectfeedback`
--
ALTER TABLE `projectfeedback`
  ADD PRIMARY KEY (`projectFeedbackID`),
  ADD KEY `projectID` (`projectID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `userType` (`userType`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`userTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientprofile`
--
ALTER TABLE `clientprofile`
  MODIFY `clientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `freelancerrating`
--
ALTER TABLE `freelancerrating`
  MODIFY `freelancerRatingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `milestoneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projectassignment`
--
ALTER TABLE `projectassignment`
  MODIFY `assignmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projectfeedback`
--
ALTER TABLE `projectfeedback`
  MODIFY `projectFeedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `userTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientprofile`
--
ALTER TABLE `clientprofile`
  ADD CONSTRAINT `clientprofile_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `freelancerprofile`
--
ALTER TABLE `freelancerprofile`
  ADD CONSTRAINT `freelancerprofile_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `freelancerrating`
--
ALTER TABLE `freelancerrating`
  ADD CONSTRAINT `freelancerrating_ibfk_1` FOREIGN KEY (`freelancerID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `freelancerrating_ibfk_2` FOREIGN KEY (`feedbackUserId`) REFERENCES `user` (`userID`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`senderID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`recipientID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `milestones`
--
ALTER TABLE `milestones`
  ADD CONSTRAINT `milestones_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `clientprofile` (`clientID`);

--
-- Constraints for table `projectassignment`
--
ALTER TABLE `projectassignment`
  ADD CONSTRAINT `projectassignment_ibfk_1` FOREIGN KEY (`freelancerID`) REFERENCES `freelancerprofile` (`freelancerID`),
  ADD CONSTRAINT `projectassignment_ibfk_2` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`);

--
-- Constraints for table `projectfeedback`
--
ALTER TABLE `projectfeedback`
  ADD CONSTRAINT `projectfeedback_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`),
  ADD CONSTRAINT `projectfeedback_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`userType`) REFERENCES `usertype` (`userTypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
