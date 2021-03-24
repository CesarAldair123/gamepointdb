DROP DATABASE IF EXISTS `gamepoint`;
CREATE DATABASE `gamepoint`;
USE `gamepoint`;

DROP USER IF EXISTS 'gamepoint'@'localhost';
CREATE USER 'gamepoint'@'localhost' IDENTIFIED BY 'gamepoint';
GRANT ALL PRIVILEGES ON * . * TO 'gamepoint'@'localhost';
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `id` int NOT NULL,
  `description` text NOT NULL,
  `developer` varchar(255) NOT NULL,
  `for_rent` int NOT NULL,
  `img_url` TEXT NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `price_per_month` double NOT NULL,
  `stock` int NOT NULL,
  `provider_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKimo00776jff8ov3d8semk9vr4` (`provider_id`),
  CONSTRAINT `FKimo00776jff8ov3d8semk9vr4` FOREIGN KEY (`provider_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `free_game_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `free_game_code` (
  `id` int NOT NULL,
  `game_code` varchar(255) NOT NULL,
  `is_used` int NOT NULL,
  `game_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pmqb63piwmy3wju0eavywl5tf` (`game_code`),
  KEY `FKjxxun6awveflgncmd7hvd7q59` (`game_id`),
  CONSTRAINT `FKjxxun6awveflgncmd7hvd7q59` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id` int NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `total` double NOT NULL,
  `total_games` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKck1t4noryw58a6jcju0pmj38` (`user_id`),
  CONSTRAINT `FKck1t4noryw58a6jcju0pmj38` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `rent_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent_game` (
  `id` int NOT NULL,
  `first_month` datetime(6) NOT NULL,
  `lasth_month` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `total` double NOT NULL,
  `was_returned` int NOT NULL,
  `game_id` int DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5ix1l2fe4lt3kd0hxqhvpbb02` (`game_id`),
  KEY `FKiraunupdnpxq99j3jcpw8booa` (`sale_id`),
  CONSTRAINT `FK5ix1l2fe4lt3kd0hxqhvpbb02` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  CONSTRAINT `FKiraunupdnpxq99j3jcpw8booa` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sale_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_details` (
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  `total` double NOT NULL,
  `game_id` int DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd61kmmqtgcyln0ff3ukka3fvr` (`game_id`),
  KEY `FKnqvhai2up4q50gyf1fcbtmt9r` (`sale_id`),
  CONSTRAINT `FKd61kmmqtgcyln0ff3ukka3fvr` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  CONSTRAINT `FKnqvhai2up4q50gyf1fcbtmt9r` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



/*INSERT DATA*/
INSERT INTO `user` VALUES (1,'gamepoint@gmail.com','$2a$10$HLrWPTWCnuKBVHOX5I3PWur7JeKBSQzoCeYbhWY3hRAxhmTZJf8eG','ADMIN','Gamepoint'),(2,'aldairgarciavelez@gmail.com','$2a$10$w6HvjiTouTvsMjBxM0iZXesyBV47EP4HkT5JHX8Za3.xQkjobxVcS','USER','Cesar Aldair');
INSERT INTO `game` VALUES (1,'Doom Eternal is a first-person shooter game developed by id Software and published by Bethesda Softworks. The sequel to Doom (2016), and the fifth main game in the Doom series, it was released on March 20, 2020, for Windows, PlayStation 4, Stadia and Xbox One, with a version for Nintendo Switch being released on December 8, 2020 and versions for PlayStation 5 and Xbox Series X and Series S being planned. Set some time after the events of the 2016 game, the story follows the Doomguy once again, on a mission to end Hell\'s consumption of Earth and foil the alien Maykrs\' plans to exterminate humanity.','ID Software',1,'https://images-na.ssl-images-amazon.com/images/I/91qm95y+rZL.jpg','Doom Eternal',700,100,92,1),(2,'Overwatch is a team-based multiplayer first-person shooter developed and published by Blizzard Entertainment. Described as a \"hero shooter\", Overwatch assigns players into two teams of six, with each player selecting from a large roster of characters, known as \"heroes\", with unique abilities. Teams work to complete map-specific objectives within a limited period of time.','Blizzard',1,'https://upload.wikimedia.org/wikipedia/en/5/51/Overwatch_cover_art.jpg','Overwatch',300,100,99,1),(3,'BioShock is a 2007 first-person shooter game developed by 2K Boston (later Irrational Games) and 2K Australia, and published by 2K Games. It is the first game in the BioShock series. The game\'s concept was developed by Irrational\'s creative lead, Ken Levine, and incorporates ideas by 20th century dystopian and utopian thinkers such as Ayn Rand, George Orwell, and Aldous Huxley, as well as historical figures such as John D. Rockefeller and Walt Disney. The game is considered a spiritual successor to the System Shock series, on which many of Irrational\'s team, including Levine, had worked previously.','2K',1,'https://s2.gaming-cdn.com/images/products/322/orig/bioshock-cover.jpg','Bioshock',250,100,95,1),(4,'Dark Souls is a 2011 action role-playing game developed by FromSoftware and published by Namco Bandai Games. A spiritual successor to FromSoftware\'s Demon\'s Souls, the game is the second installment in the Souls series. Dark Souls takes place in the fictional kingdom of Lordran, where players assume the role of a cursed undead character who begins a pilgrimage to discover the fate of their kind. ','FromSoftware',1,'https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/Dark_Souls_Cover_Art.jpg/220px-Dark_Souls_Cover_Art.jpg','Dark Souls',200,50,100,1),(5,'BioShock Infinite is a first-person shooter video game developed by Irrational Games and published by 2K Games. It was released worldwide for the Microsoft Windows, PlayStation 3, Xbox 360, and OS X platforms in 2013, and a Linux port was released in 2015.','2K',1,'https://images.g2a.com/newlayout/323x433/1x1x0/8c5bc0939a03/5f9c03df46177c7f412d8fe2','Bioshock Infinite',400,100,100,1),(6,'Grand Theft Auto V is a 2013 action-adventure game developed by Rockstar North and published by Rockstar Games. It is the first main entry in the Grand Theft Auto series since 2008\'s Grand Theft Auto IV. Set within the fictional state of San Andreas, based on Southern California','RockStar',1,'https://i.pinimg.com/originals/46/f3/fd/46f3fdb5f464dd8f1ac72f908f764ded.jpg','Grand Theft Auto V',900,100,100,1),(7,'Gameplay focuses on an open world where the player can complete missions to progress an overall story, as well as engage in various side activities. Most of the gameplay revolves around driving, shooting, and stealth, with occasional role-playing and puzzle elements. The games in the Watch Dogs series are set in fictionalized versions of real-life cities','Ubisoft',0,'https://s3.gaming-cdn.com/images/products/254/orig/watch-dogs-cover.jpg','Watch Dogs',400,100,100,1),(8,'Minecraft is a sandbox video game developed by Mojang. The game was created by Markus \"Notch\" Persson in the Java programming language. Following several early test versions, it was released as a paid public alpha for personal computers in 2009 before releasing in November 2011, with Jens Bergensten taking over development. Minecraft has since been ported to several other platforms and is the best-selling video game of all time, with 200 million copies sold and 126 million monthly active users as of 2020.','Mojang',1,'https://i.redd.it/19dfwvasn7741.jpg','Minecraft',400,30,100,1),(9,'Bloodborne is an action role-playing game developed by FromSoftware and published by Sony Computer Entertainment, which released for the PlayStation 4 in March 2015. Bloodborne follows the player\'s character, a Hunter, through the decrepit Gothic, Victorian era–inspired city of Yharnam, whose inhabitants are afflicted with a blood-borne disease. Attempting to find the source of the plague, the player\'s character unravels the city\'s mysteries while fighting beasts and cosmic beings.','FromSoftware',1,'https://image.api.playstation.com/vulcan/img/rnd/202010/2614/Sy5e8DmeKIJVjlAGraPAJYkT.png','Bloodborne',400,100,100,1),(10,'Fallout: New Vegas is a post-apocalyptic action role-playing video game developed by Obsidian Entertainment and published by Bethesda Softworks. It was announced in April 2009 and released for Microsoft Windows, PlayStation 3, and Xbox 360 on October 19, 2010. ','Obsidian Studios',1,'https://e.snmc.io/lk/g/x/4162acc6e92b8b0296ee1d3dc1a1527c/6689332','Fallout New Vegas',200,10,100,1),(11,'Halo 5: Guardians is a first-person shooter video game developed by 343 Industries and published by Microsoft Studios for the Xbox One. The fifth mainline entry and tenth overall in the Halo series, it was released worldwide on October 27, 2015. The game\'s plot follows two fireteams of human supersoldiers: Blue Team, led by Master Chief, and Fireteam Osiris, led by Spartan Locke. When the former goes absent without leave to track down the artificial intelligence construct Cortana, Master Chief\'s loyalty is called into question and Fireteam Osiris is sent to retrieve him.','343 Industries',1,'https://i.pinimg.com/originals/91/1c/cc/911ccc5abb6806944ad983a4528d0231.jpg','Halo 5',900,50,100,1),(12,'Call of Duty: Black Ops II is a 2012 first-person shooter video game developed by Treyarch and published by Activision. It was released for Microsoft Windows, PlayStation 3, and Xbox 360 on November 12, 2012, and for the Wii U on November 18 in North America and November 30 in PAL regions.','Treyarch',0,'https://media.gamestop.com/i/gamestop/COD%20Black%20Ops%202%20-%20HeroTM/call-of-duty-black-ops-2.jpg?$POI$&w=768&aspect=.66:1','Black Ops 2',300,100,10,2);
