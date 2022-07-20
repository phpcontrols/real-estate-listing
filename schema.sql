-- Create syntax for TABLE 'account'
CREATE TABLE `account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `role_id` varchar(64) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'image'
CREATE TABLE `image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'inquiry'
CREATE TABLE `inquiry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `inquiry_status_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'inquiry_status'
CREATE TABLE `inquiry_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'listing'
CREATE TABLE `listing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL,
  `listing_status_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `listing_type_id` int(11) DEFAULT NULL,
  `property_type_id` int(11) DEFAULT NULL,
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  `zip` varchar(64) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `latitude` varchar(64) DEFAULT NULL,
  `longitude` varchar(64) DEFAULT NULL,
  `asking_price` decimal(11,0) DEFAULT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `bath` decimal(10,2) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `lot` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `description` text,
  `main_photo_id` varchar(255) DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'listing_status'
CREATE TABLE `listing_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'listing_type'
CREATE TABLE `listing_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'property_type'
CREATE TABLE `property_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'role'
CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;


INSERT INTO `account` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `active`, `role_id`, `photo`)
VALUES
	(1, 'John', 'Bee', 'stacy@test.com', '(602)202-1022', '', 1, '1', 'agent1.jpeg'),
	(2, 'Ron', 'Winkle', 'rob@agent.com', '(602)212-2222', '', 1, '1', 'agent2.jpeg'),
	(3, 'Jay', 'Thomas', 'jay@agent.com', '(601)132-3322', '', 1, '1', 'agent3.jpeg'),
	(4, 'Becky', 'Franklin', 'agent@test.com', '(602)999-1332', '', 0, '1', 'agent4.jpeg'),
	(5, 'Guy', 'Broker', 'broker@test.com', '(612)122-8943', '', 1, '2', 'agent5.jpeg');


INSERT INTO `image` (`id`, `url`, `description`, `listing_id`)
VALUES
	(1, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5b2f14d4072bcfc728/original/house10.jpg', 'Front', 1),
	(2, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5b2f14d4072bcfc729/original/kitchen6.jpg', 'Kitchen', 1),
	(3, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5b2f14d4072bcfc72c/original/bath1.jpg', 'Bathroom', 1),
	(4, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5c2f14d4072bcfc72e/original/bed2.jpg', 'Bedroom', 2),
	(5, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5c2f14d4072bcfc72f/original/condo1.jpg', 'Front', 2),
	(6, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5d2f14d4072bcfc730/original/kitchen11.jpg', 'Kitchen', 2),
	(7, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5d2f14d4072bcfc731/original/bath3.jpg', 'Bathroom', 3),
	(8, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5d2f14d4072bcfc732/original/bed1.jpeg', 'Bedroom', 3),
	(9, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5e2f14d4072bcfc733/original/house8.jpeg', 'Front', 3),
	(10, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5e2f14d4072bcfc734/original/bath4.jpg', 'Bathroom', 4),
	(11, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5e2f14d4072bcfc735/original/kitchen4.jpg', 'Kitchen', 4),
	(12, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5f2f14d4072bcfc736/original/bed7.jpg', 'Bedroom', 4),
	(13, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d5f2f14d4072bcfc737/original/house5.jpg', 'Front', 5),
	(14, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d602f14d4072bcfc738/original/kitchen7.jpg', 'Kitchen', 5),
	(15, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d602f14d4072bcfc739/original/bath6.jpg', 'Bathroom', 5),
	(16, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d612f14d4072bcfc73a/original/bed7.jpg', 'Bedroom', 6),
	(17, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d612f14d4072bcfc73b/original/bath6.jpg', 'Bathroom', 6),
	(18, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d612f14d4072bcfc73c/original/bed2.jpg', 'Bedroom', 6),
	(19, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d622f14d4072bcfc73d/original/kitchen12.jpg', 'Kitchen', 6),
	(20, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d622f14d4072bcfc73e/original/house4.jpg', 'Front', 2),
	(21, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d632f14d4072bcfc73f/original/kitchen9.jpg', 'Kitchen', 1),
	(22, 'https://s3.amazonaws.com/assets.knackhq.com/assets/62844d55f332ac001ee82a3e/62844d632f14d4072bcfc740/original/bed7.jpg', 'Bedroom', 5);


INSERT INTO `inquiry` (`id`, `date`, `listing_id`, `inquiry_status_id`, `first_name`, `last_name`, `email`, `phone`, `message`, `agent_id`)
VALUES
	(1, '2022-02-18', 3, 1, 'Sofia', 'Coelho', 'sofia@hotmail.com', '(399) 537-2694', 'Please call me!', 1),
	(2, '2022-04-18', 2, 1, 'Summer', 'Smith', 'summer@aol.com', '(286) 481-9376', 'Do you have an inspection report for this property?', 2),
	(3, '2022-03-17', 4, 2, 'Ty', 'Riley', 'ty@myemail.com', '(888) 555-8631', 'When will be your next showing?', 3),
	(4, '2021-07-17', 1, 3, 'Ranasha', 'Chittick', 'ranasha@me.com', '(602) 469-0626', 'Is this home still available?', 5),
	(5, '2021-07-17', 2, 2, 'Joe', 'Blow', 'kpee@me.com', '(332) 416-0226', 'Is this home still available?', 2),
	(6, '2021-07-17', 2, 1, 'Mlo', 'MM', 'ranasha@me.com', '(202) 169-1226', 'Is this home still available?', 1),
	(7, '2021-07-17', 1, 2, 'Another', 'Dude', 'dude@this.com', '(302) 469-1126', 'Is this home still available?', 3),
	(8, '2021-07-17', 3, 3, 'Nobody', 'Bud', 'nobud@me.com', '(626) 549-0336', 'Is this home still available?', 4),
	(9, '2021-07-17', 4, 1, 'Guy', 'Loo', 'loo@guy.com', '(602) 123-0234', 'Is this home still available?', 3),
	(10, '2021-07-17', 4, 3, 'Good', 'Love', 'lovegg@g.com', '(622) 433-0612', 'Is this home still available?', 2);


INSERT INTO `inquiry_status` (`id`, `status`)
VALUES
	(1, 'Processed'),
	(2, 'New'),
	(3, 'Closed');


INSERT INTO `listing` (`id`, `agent_id`, `listing_status_id`, `date`, `listing_type_id`, `property_type_id`, `street1`, `street2`, `city`, `state`, `zip`, `country`, `latitude`, `longitude`, `asking_price`, `bedrooms`, `bath`, `area`, `lot`, `year`, `description`, `main_photo_id`, `published`)
VALUES
	(1, 1, 1, '2022-01-02', 1, 1, '1234 W Main St', '', 'Prescott', 'AZ', '85412', '', '34.588754', '-112.337083', 250000, 3, 2.00, 2400, 10000, 2013, 'This is off of Snell Avenue in a court. Well maintained home bedrooms plus an office. Formal Living Room and a separate Family Room. Convenient to Freeway Access. ', '1', 1),
	(2, 1, 3, '2022-04-11', 1, 1, '2020 W Highland', '', 'San Diego', 'CA', '92029', '', '33.088107', '-117.110181', 2000000, 4, 2.00, 2500, 15000, 2007, 'Cupcake ipsum dolor sit amet I love gummi bears caramels soufflé. Cheesecake sugar plum donut topping apple pie sesame snaps candy danish pastry. Lollipop dragée sweet roll I love sweet roll I love.', '4', 1),
	(3, 2, 1, '2022-01-12', 1, 1, '11255 W Turnkey', '', 'San Francisco', 'CA', '94115', '', '37.958304', '-122.09413', 250000, 1, 1.00, 1000, 0, 2005, 'Gingerbread sweet roll cake icing brownie toffee pastry. Chupa chups chocolate bar icing. Cookie toffee tart apple pie cheesecake jujubes cake tootsie roll. Bear claw I love pie sesame snaps lollipop. ', '7', 1),
	(4, 3, 2, '2022-03-03', 2, 3, '2222 W First St', '', 'Phoenix', 'AZ', '85048', '', '33.305218', '-112.074736', 250000, 5, 2.50, 3500, 18001, 2016, 'Wonderful Ranch style home with beautiful Stone exterior is certain to impress. Living room opens to dining room with built in China cabinet. Hardwood floors throughout. 3 bedrooms all with nice size closets. Basement offers finished recreation room, workshop, 2 storage rooms and spacious laundry area. New roof, sump pump and hot water tank. Newer storm doors. New tub surround in bathroom. Updated electrical box. Fresh paint. Chimney rebuilt in 2018. Fenced yard. Great location close to freeways, shopping, schools and walking distance to Brooklyn Recreation Center with an indoor swimming pool, skating rink and exercise rooms. No neighbors behind this property as it backs to green space of city recreation center. Don\'t miss.', '10', 1),
	(5, 4, 1, '2022-02-01', 1, 2, '78942 N Pinnacle Peak', '', 'Scottsdale', 'AZ', '85255', '', '33.698521', '-111.888806', 2500, 4, 3.00, 4500, 16201, 2001, 'Seller offering a $2,000 paint credit at closing!!!! Come see this 3 bedroom, 2 bathroom home located in North Phoenix! In close proximity to the 51 and 101 freeways, shopping centers, restaurants, and within the highly praised Paradise Valley School District, all without an HOA! Vaulted ceilings, large great room with fireplace and open floor plan boasting natural lighting. Plenty of storage space throughout the home, built in cabinets in garage, and additional storage shed in the oversized backyard. Make the backyard anything you want it to be and relax under your extended patio.', '10', 1),
	(6, 5, 1, '2022-05-09', 1, 2, '2727 W Second St', '', 'Brooklyn', 'NY', '11223', '', '40.583828', '-73.970837', 525000, 5, 5.00, 1200, 5000, 2008, 'RARE FIND IN BROOKLYN! Outstanding Park Like Double Lot 80x250!! Creek runs along back of property,vinyl sided colonial,3 bedrooms,1 1/2 baths,formal dining room,newer furnace,central air,h.w.tanks,and windows,enclosed back porch,full basement,glass block windows,storage shed,2 1/2 car garage w/opener', '22', 1);


INSERT INTO `listing_status` (`id`, `status`)
VALUES
	(1, 'Active'),
	(2, 'Closed'),
	(3, 'In-Contract');

INSERT INTO `listing_type` (`id`, `type`)
VALUES
	(1, 'For Sale'),
	(2, 'For Rent');

INSERT INTO `property_type` (`id`, `type`)
VALUES
	(1, 'Single Family'),
	(2, 'Condo'),
	(3, 'Town Home');

INSERT INTO `role` (`id`, `name`)
VALUES
	(1, 'Agent'),
	(2, 'Broker');
